/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class AppSubscription implements _i1.SerializableModel {
  AppSubscription._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.expiresAt,
    required this.provider,
    required this.productId,
  });

  factory AppSubscription({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime expiresAt,
    required _i3.AppSubscriptionProvider provider,
    required String productId,
  }) = _AppSubscriptionImpl;

  factory AppSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppSubscription(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      provider: _i3.AppSubscriptionProvider.fromJson(
          (jsonSerialization['provider'] as int)),
      productId: jsonSerialization['productId'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  DateTime expiresAt;

  _i3.AppSubscriptionProvider provider;

  String productId;

  AppSubscription copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? expiresAt,
    _i3.AppSubscriptionProvider? provider,
    String? productId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'expiresAt': expiresAt.toJson(),
      'provider': provider.toJson(),
      'productId': productId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppSubscriptionImpl extends AppSubscription {
  _AppSubscriptionImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime expiresAt,
    required _i3.AppSubscriptionProvider provider,
    required String productId,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          expiresAt: expiresAt,
          provider: provider,
          productId: productId,
        );

  @override
  AppSubscription copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    DateTime? expiresAt,
    _i3.AppSubscriptionProvider? provider,
    String? productId,
  }) {
    return AppSubscription(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      expiresAt: expiresAt ?? this.expiresAt,
      provider: provider ?? this.provider,
      productId: productId ?? this.productId,
    );
  }
}
