import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pc;
import 'package:crypto_keys/crypto_keys.dart' as ck;
import 'package:serverpod_subscription_server/src/util/apple/models.dart';
import 'package:x509/x509.dart' as x509;

const appleRootCA = """-----BEGIN CERTIFICATE-----
MIICQzCCAcmgAwIBAgIILcX8iNLFS5UwCgYIKoZIzj0EAwMwZzEbMBkGA1UEAwwS
QXBwbGUgUm9vdCBDQSAtIEczMSYwJAYDVQQLDB1BcHBsZSBDZXJ0aWZpY2F0aW9u
IEF1dGhvcml0eTETMBEGA1UECgwKQXBwbGUgSW5jLjELMAkGA1UEBhMCVVMwHhcN
MTQwNDMwMTgxOTA2WhcNMzkwNDMwMTgxOTA2WjBnMRswGQYDVQQDDBJBcHBsZSBS
b290IENBIC0gRzMxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9y
aXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUzB2MBAGByqGSM49
AgEGBSuBBAAiA2IABJjpLz1AcqTtkyJygRMc3RCV8cWjTnHcFBbZDuWmBSp3ZHtf
TjjTuxxEtX/1H7YyYl3J6YRbTzBPEVoA/VhYDKX1DyxNB0cTddqXl5dvMVztK517
IDvYuVTZXpmkOlEKMaNCMEAwHQYDVR0OBBYEFLuw3qFYM4iapIqZ3r6966/ayySr
MA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49BAMDA2gA
MGUCMQCD6cHEFl4aXTQY2e3v9GwOAEZLuN+yRhHFD/3meoyhpmvOwgPUnPWTxnS4
at+qIxUCMG1mihDK1A3UT82NQz60imOlM27jbdoXt2QfyFMm+YhidDkLF1vLUagM
6BgD56KyKA==
-----END CERTIFICATE-----
""";

DecodedApplePayload? verifyAndDecodePayload({
  required String signedPayload, // Payload string (signed data)
}) {
  try {
    List<String> jwtParts = signedPayload.split('.');
    if (jwtParts.length != 3) {
      throw Exception('Invalid JWT format');
    }

    String header = utf8.decode(base64Url.decode(base64Url.normalize(jwtParts[0])));
    String payload = utf8.decode(base64Url.decode(base64Url.normalize(jwtParts[1])));

    print("*********");
    print(payload);

    print("*********");

    final payloadData = jsonDecode(payload);

    return DecodedApplePayload.fromJson(payloadData);
  } catch (e, st) {
    print(e);
    print(st);
    return null;
  }

//     Uint8List signature = base64Url.decode(base64Url.normalize(jwtParts[2]));

//     Uint8List message = Uint8List.fromList(utf8.encode('${jwtParts[0]}.${jwtParts[1]}'));

//     Iterable<dynamic> parsedCerts = x509.parsePem(appleRootCA);

//     // Filter and get the X509Certificate
//     x509.X509Certificate? appleCert = parsedCerts.firstWhere(
//       (element) => element is x509.X509Certificate,
//       orElse: () => null,
//     ) as x509.X509Certificate?;

//     if (appleCert == null) {
//       throw Exception('No valid X509Certificate found in PEM data.');
//     }

//     final ecPublicKey = appleCert.publicKey as x509.EcPublicKey;

//     print(ecPublicKey.runtimeType);
//     print("*********");

//     final eccCurve = pc.ECCurve_secp256r1(); // You can also use secp256k1 based on the key
//     final q = eccCurve.curve.createPoint(ecPublicKey.xCoordinate, ecPublicKey.yCoordinate);
//     final pointycastlePublicKey = pc.ECPublicKey(q, eccCurve);

//     final ecSigner = pc.ECDSASigner(pc.SHA256Digest());
//     ecSigner.init(false, pc.PublicKeyParameter<pc.ECPublicKey>(pointycastlePublicKey));

// //  bool isValidSignature = ecSigner.verifySignature(
// //       message,
// //       pc.ECSignature.fromDER(signature),
// //     );

//     // if (!isValidSignature) {
//     //   print('Invalid signature');
//     //   return null;
//     // }

//     print('Signature is valid');

//     // Step 6: Return decoded payload (assumed to be JSON)
//     return jsonDecode(payload) as Map<String, dynamic>;
//   } catch (e, st) {
//     print('Error during verification or decoding: $e');
//     print(st);
//     return null;
//   }
}

// dynamic decryptApplePayload(String payload) {

//     X509CertificateData appleCert = parsePem(appleRootCA).first;
// RSAPublicKey applePublicKey = appleCert.publicKey as RSAPublicKey;

//   Uint8List payload = utf8.encode(payload) as Uint8List;
//   Uint8List signature = base64Decode('signature-base64-here');

// // Create verifier
//   final verifier = RSASigner(SignerAlgorithm.SHA256_RSA)..init(false, PublicKeyParameter<RSAPublicKey>(applePublicKey));

// // Verify the signature
//   bool isValidSignature = verifier.verifySignature(payload, RSASignature(signature));

//   if (isValidSignature) {
//     print('Signature is valid');
//   } else {
//     print('Signature is invalid');
//   }
// }


