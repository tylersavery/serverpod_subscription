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
import 'dart:async' as _i2;
import 'package:serverpod_subscription_client/src/protocol/apple_purchase_details.dart'
    as _i3;

/// {@category Endpoint}
class EndpointApple extends _i1.EndpointRef {
  EndpointApple(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'serverpod_subscription.apple';

  _i2.Future<bool> handlePurchase(_i3.AppPurchaseDetails details) =>
      caller.callServerEndpoint<bool>(
        'serverpod_subscription.apple',
        'handlePurchase',
        {'details': details},
      );
}

class Caller extends _i1.ModuleEndpointCaller {
  Caller(_i1.ServerpodClientShared client) : super(client) {
    apple = EndpointApple(this);
  }

  late final EndpointApple apple;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'serverpod_subscription.apple': apple};
}
