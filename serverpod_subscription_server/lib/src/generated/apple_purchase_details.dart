/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class AppPurchaseDetails
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AppPurchaseDetails._({
    this.purchaseID,
    required this.productID,
    required this.localVerificationData,
    required this.serverVerificationData,
    required this.source,
    this.transactionDate,
  });

  factory AppPurchaseDetails({
    String? purchaseID,
    required String productID,
    required String localVerificationData,
    required String serverVerificationData,
    required String source,
    String? transactionDate,
  }) = _AppPurchaseDetailsImpl;

  factory AppPurchaseDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppPurchaseDetails(
      purchaseID: jsonSerialization['purchaseID'] as String?,
      productID: jsonSerialization['productID'] as String,
      localVerificationData:
          jsonSerialization['localVerificationData'] as String,
      serverVerificationData:
          jsonSerialization['serverVerificationData'] as String,
      source: jsonSerialization['source'] as String,
      transactionDate: jsonSerialization['transactionDate'] as String?,
    );
  }

  String? purchaseID;

  String productID;

  String localVerificationData;

  String serverVerificationData;

  String source;

  String? transactionDate;

  AppPurchaseDetails copyWith({
    String? purchaseID,
    String? productID,
    String? localVerificationData,
    String? serverVerificationData,
    String? source,
    String? transactionDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (purchaseID != null) 'purchaseID': purchaseID,
      'productID': productID,
      'localVerificationData': localVerificationData,
      'serverVerificationData': serverVerificationData,
      'source': source,
      if (transactionDate != null) 'transactionDate': transactionDate,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (purchaseID != null) 'purchaseID': purchaseID,
      'productID': productID,
      'localVerificationData': localVerificationData,
      'serverVerificationData': serverVerificationData,
      'source': source,
      if (transactionDate != null) 'transactionDate': transactionDate,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppPurchaseDetailsImpl extends AppPurchaseDetails {
  _AppPurchaseDetailsImpl({
    String? purchaseID,
    required String productID,
    required String localVerificationData,
    required String serverVerificationData,
    required String source,
    String? transactionDate,
  }) : super._(
          purchaseID: purchaseID,
          productID: productID,
          localVerificationData: localVerificationData,
          serverVerificationData: serverVerificationData,
          source: source,
          transactionDate: transactionDate,
        );

  @override
  AppPurchaseDetails copyWith({
    Object? purchaseID = _Undefined,
    String? productID,
    String? localVerificationData,
    String? serverVerificationData,
    String? source,
    Object? transactionDate = _Undefined,
  }) {
    return AppPurchaseDetails(
      purchaseID: purchaseID is String? ? purchaseID : this.purchaseID,
      productID: productID ?? this.productID,
      localVerificationData:
          localVerificationData ?? this.localVerificationData,
      serverVerificationData:
          serverVerificationData ?? this.serverVerificationData,
      source: source ?? this.source,
      transactionDate:
          transactionDate is String? ? transactionDate : this.transactionDate,
    );
  }
}
