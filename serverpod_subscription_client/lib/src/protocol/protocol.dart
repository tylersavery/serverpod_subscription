/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'app_subscription.dart' as _i2;
import 'app_subscription_provider.dart' as _i3;
import 'apple_purchase_details.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
export 'app_subscription.dart';
export 'app_subscription_provider.dart';
export 'apple_purchase_details.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.AppSubscription) {
      return _i2.AppSubscription.fromJson(data) as T;
    }
    if (t == _i3.AppSubscriptionProvider) {
      return _i3.AppSubscriptionProvider.fromJson(data) as T;
    }
    if (t == _i4.AppPurchaseDetails) {
      return _i4.AppPurchaseDetails.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AppSubscription?>()) {
      return (data != null ? _i2.AppSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AppSubscriptionProvider?>()) {
      return (data != null ? _i3.AppSubscriptionProvider.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.AppPurchaseDetails?>()) {
      return (data != null ? _i4.AppPurchaseDetails.fromJson(data) : null) as T;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.AppSubscription) {
      return 'AppSubscription';
    }
    if (data is _i3.AppSubscriptionProvider) {
      return 'AppSubscriptionProvider';
    }
    if (data is _i4.AppPurchaseDetails) {
      return 'AppPurchaseDetails';
    }
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AppSubscription') {
      return deserialize<_i2.AppSubscription>(data['data']);
    }
    if (data['className'] == 'AppSubscriptionProvider') {
      return deserialize<_i3.AppSubscriptionProvider>(data['data']);
    }
    if (data['className'] == 'AppPurchaseDetails') {
      return deserialize<_i4.AppPurchaseDetails>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i5.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
