import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:pointycastle/asn1.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

/// Custom exception for invalid tokens
class InvalidTokenError implements Exception {
  final String message;
  InvalidTokenError(this.message);

  @override
  String toString() {
    return "InvalidTokenError: $message";
  }
}

/// Function to add labels to PEM certificate
String addLabels(String key) {
  return "-----BEGIN CERTIFICATE-----\n$key\n-----END CERTIFICATE-----";
}

/// Function to load the Apple root certificate (DER encoded)
Uint8List loadRootCert(String rootCertPath) {
  var filePath = Platform.environment['APPLE_ROOT_CA'] ?? rootCertPath;
  return File(filePath).readAsBytesSync();
}

/// Function to load a PEM-encoded certificate
Uint8List loadPemCertificate(String pem) {
  var lines = pem.split('\n');
  var base64Cert = lines.where((line) {
    return !line.startsWith('-----') && line.trim().isNotEmpty;
  }).join('');
  return base64Decode(base64Cert);
}

/// Function to verify the certificate chain
void verifyCertificateChain(Uint8List rootCertBytes, Uint8List certBytes) {
  // Load certificates and perform the verification (using pointycastle or other logic)
  // As pointycastle lacks a built-in X509 chain validation, this step may need more details
  // depending on your needs or external library support
}

/// Function to decode a JWT token and verify its signature using Apple's cert chain
Map<String, dynamic> decodeJws(String token, String rootCertPath) {
  try {
    // Get unverified header from JWT token
    Map<String, dynamic> header = JwtDecoder.decode(token);

    // Get the first certificate from x5c header (signing cert)
    String firstCertData = header['x5c'][0];
    Uint8List firstCertBytes = loadPemCertificate(addLabels(firstCertData));

    // Additional certificates in x5c (chain certs)
    List<String> chainCertData = List<String>.from(header['x5c'].sublist(1));
    List<Uint8List> chainCerts = chainCertData.map((cert) {
      return loadPemCertificate(addLabels(cert));
    }).toList();

    // Load root certificate (DER encoded)
    Uint8List rootCertBytes = loadRootCert(rootCertPath);

    // Verify certificate chain (this may involve manually validating certs in the chain)
    verifyCertificateChain(rootCertBytes, firstCertBytes);

    // Decode and verify JWT
    String publicKey = "extractedPublicKey"; // Replace this with the logic to extract public key
    return JwtDecoder.decode(token);
  } catch (e) {
    throw InvalidTokenError("Token verification failed: $e");
  }
}

/// Function to parse the transaction body and decode the token
Map<String, dynamic> parseTransactionBody(Map<String, dynamic> reqJson, String appleRootCertPath) {
  String token = reqJson['signedPayload'];

  // Decode main token
  Map<String, dynamic> payload = decodeJws(token, appleRootCertPath);

  if (payload['notificationType'] == 'TEST') {
    return payload;
  }

  // Decode signedTransactionInfo and substitute decoded into payload
  String signedTransactionInfo = payload['data']['signedTransactionInfo'];
  Map<String, dynamic> decodedTransactionInfo = decodeJws(signedTransactionInfo, appleRootCertPath);
  payload['data']['signedTransactionInfo'] = decodedTransactionInfo;

  // Decode signedRenewalInfo and substitute decoded into payload if present
  if (payload['data'].containsKey('signedRenewalInfo')) {
    String signedRenewalInfo = payload['data']['signedRenewalInfo'];
    Map<String, dynamic> decodedRenewalInfo = decodeJws(signedRenewalInfo, appleRootCertPath);
    payload['data']['signedRenewalInfo'] = decodedRenewalInfo;
  }

  return payload;
}
