import 'dart:convert';

import 'package:serverpod_subscription_server/src/util/apple/decrypt_apple_payload.dart';

class AppleTransaction {
  final String transactionId;
  final String originalTransactionId;
  final String webOrderLineItemId;
  final String bundleId;
  final String productId;
  final String subscriptionGroupIdentifier;
  final DateTime purchaseDate;
  final DateTime originalPurchaseDate;
  final DateTime expiresDate;
  final int quantity;
  final String type;
  final String inAppOwnershipType;
  final DateTime signedDate;
  final String environment;
  final String transactionReason;
  final String storefront;
  final String storefrontId;
  final int price;
  final String currency;

  const AppleTransaction({
    required this.transactionId,
    required this.originalTransactionId,
    required this.webOrderLineItemId,
    required this.bundleId,
    required this.productId,
    required this.subscriptionGroupIdentifier,
    required this.purchaseDate,
    required this.originalPurchaseDate,
    required this.expiresDate,
    required this.quantity,
    required this.type,
    required this.inAppOwnershipType,
    required this.signedDate,
    required this.environment,
    required this.transactionReason,
    required this.storefront,
    required this.storefrontId,
    required this.price,
    required this.currency,
  });

  factory AppleTransaction.fromJson(Map<String, dynamic> json) {
    return AppleTransaction(
      transactionId: json['transactionId'],
      originalTransactionId: json['originalTransactionId'],
      webOrderLineItemId: json['webOrderLineItemId'],
      bundleId: json['bundleId'],
      productId: json['productId'],
      subscriptionGroupIdentifier: json['subscriptionGroupIdentifier'],
      purchaseDate: DateTime.fromMillisecondsSinceEpoch(json['purchaseDate']),
      originalPurchaseDate: DateTime.fromMillisecondsSinceEpoch(json['originalPurchaseDate']),
      expiresDate: DateTime.fromMillisecondsSinceEpoch(json['expiresDate']),
      quantity: json['quantity'],
      type: json['type'],
      inAppOwnershipType: json['inAppOwnershipType'],
      signedDate: DateTime.fromMillisecondsSinceEpoch(json['signedDate']),
      environment: json['environment'],
      transactionReason: json['transactionReason'],
      storefront: json['storefront'],
      storefrontId: json['storefrontId'],
      price: json['price'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'originalTransactionId': originalTransactionId,
      'webOrderLineItemId': webOrderLineItemId,
      'bundleId': bundleId,
      'productId': productId,
      'subscriptionGroupIdentifier': subscriptionGroupIdentifier,
      'purchaseDate': purchaseDate,
      'originalPurchaseDate': originalPurchaseDate,
      'expiresDate': expiresDate,
      'quantity': quantity,
      'type': type,
      'inAppOwnershipType': inAppOwnershipType,
      'signedDate': signedDate,
      'environment': environment,
      'transactionReason': transactionReason,
      'storefront': storefront,
      'storefrontId': storefrontId,
      'price': price,
      'currency': currency,
    };
  }

  bool get isSandbox {
    return environment.toUpperCase() == 'SANDBOX';
  }

  double get priceInDollars {
    return price / 100;
  }
}

class AppleRenewalInfo {
  final String originalTransactionId;
  final String autoRenewProductId;
  final String productId;
  final int autoRenewStatus;
  final int renewalPrice;
  final String currency;
  final int signedDate;
  final String environment;
  final int recentSubscriptionStartDate;
  final int renewalDate;

  const AppleRenewalInfo({
    required this.originalTransactionId,
    required this.autoRenewProductId,
    required this.productId,
    required this.autoRenewStatus,
    required this.renewalPrice,
    required this.currency,
    required this.signedDate,
    required this.environment,
    required this.recentSubscriptionStartDate,
    required this.renewalDate,
  });

  factory AppleRenewalInfo.fromJson(Map<String, dynamic> json) {
    return AppleRenewalInfo(
      originalTransactionId: json['originalTransactionId'],
      autoRenewProductId: json['autoRenewProductId'],
      productId: json['productId'],
      autoRenewStatus: json['autoRenewStatus'],
      renewalPrice: json['renewalPrice'],
      currency: json['currency'],
      signedDate: json['signedDate'],
      environment: json['environment'],
      recentSubscriptionStartDate: json['recentSubscriptionStartDate'],
      renewalDate: json['renewalDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalTransactionId': originalTransactionId,
      'autoRenewProductId': autoRenewProductId,
      'productId': productId,
      'autoRenewStatus': autoRenewStatus,
      'renewalPrice': renewalPrice,
      'currency': currency,
      'signedDate': signedDate,
      'environment': environment,
      'recentSubscriptionStartDate': recentSubscriptionStartDate,
      'renewalDate': renewalDate,
    };
  }
}

class DecodedApplePayloadData {
  final int appAppleId;
  final String bundleId;
  final String bundleVersion;
  final String environment;
  final AppleTransaction transaction;
  final AppleRenewalInfo renewalInfo;

  const DecodedApplePayloadData({
    required this.appAppleId,
    required this.bundleId,
    required this.bundleVersion,
    required this.environment,
    required this.transaction,
    required this.renewalInfo,
  });

  factory DecodedApplePayloadData.fromJson(Map<String, dynamic> json) {
    final signedTxInfo = parseTransactionInfo(json['signedTransactionInfo']);

    print("----------");
    print(jsonEncode(signedTxInfo));
    print("----------");

    final signedRenewalInfo = parseTransactionInfo(json['signedRenewalInfo']);

    return DecodedApplePayloadData(
      appAppleId: json['appAppleId'],
      bundleId: json['bundleId'],
      bundleVersion: json['bundleVersion'],
      environment: json['environment'],
      transaction: AppleTransaction.fromJson(signedTxInfo),
      renewalInfo: AppleRenewalInfo.fromJson(signedRenewalInfo),
    );
  }

  static Map<String, dynamic> parseTransactionInfo(dynamic signedTransactionInfo) {
    var transactionInfoContent = signedTransactionInfo.split(".")[1];

    var transactionInfoJws = base64Url.decode(base64.normalize(transactionInfoContent));
    var transactionInfoData = json.decode(utf8.decode(transactionInfoJws));

    return transactionInfoData;
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'appAppleId': appAppleId,
      'bundleId': bundleId,
      'bundleVersion': bundleVersion,
      'environment': environment,
      'transaction': transaction.toJson(),
      'renewalInfo': renewalInfo.toJson(),
    };
  }
}

class DecodedApplePayload {
  final String notificationType;
  final String? subType;
  final String notificationUuid;
  final DecodedApplePayloadData data;

  const DecodedApplePayload({
    required this.notificationType,
    this.subType,
    required this.notificationUuid,
    required this.data,
  });

  factory DecodedApplePayload.fromJson(Map<String, dynamic> json) {
    print("------");
    print(json);
    print("------");
    return DecodedApplePayload(
      notificationType: json['notificationType'],
      subType: json['subType'],
      notificationUuid: json['notificationUUID'],
      data: DecodedApplePayloadData.fromJson(json['data']),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'notificationType': notificationType,
      'subType': subType,
      'notificationUUID': notificationUuid,
      'data': data.toJson(),
    };
  }
}
