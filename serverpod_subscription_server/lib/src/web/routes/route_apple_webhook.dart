import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_subscription_server/src/generated/protocol.dart';
import 'package:serverpod_subscription_server/src/util/apple/apple_decryption.dart';
import 'package:serverpod_subscription_server/src/util/apple/decrypt_apple_payload.dart';

/// A route that captures the subscription webhook sent from apple
class RouteAppleWebhook extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    print('Apple Webhook Detected');

    if (request.method == 'POST') {
      try {
        String content = await utf8.decoder.bind(request).join();
        Map<String, dynamic> body = jsonDecode(content);

        final notification = verifyAndDecodePayload(signedPayload: body['signedPayload']);

        if (notification != null) {
          final type = notification.notificationType;

          switch (type) {
            case 'TEST':
              print('Test Notification');
              break;
            case 'SUBSCRIBED':
            case 'DID_RENEW':
            case 'EXPIRED':
              final data = notification.data;

              final transaction = data.transaction;
              final renewalInfo = data.renewalInfo;
              print("========================");

            // final userIdentifier = data.transaction.
            // final expiresAt = DateTime.fromMillisecondsSinceEpoch(int.parse(transactionInfo['expiresDate']));

            // final userInfo = await UserInfo.db.findFirstRow(session, where: (row) => row.userIdentifier.equals(userIdentifier));
            // if (userInfo != null && userInfo.id != null) {
            //   final appSubscription = AppSubscription(
            //     userInfoId: userInfo.id!,
            //     userInfo: userInfo,
            //     expiresAt: expiresAt,
            //     provider: AppSubscriptionProvider.apple,
            //     productId: "TODO",
            //   );

            //   await AppSubscription.db.updateRow(session, appSubscription);
            // }
          }
        }

        // Send a response back
        request.response
          ..statusCode = HttpStatus.ok
          ..write('Received data successfully!');

        await request.response.close();
      } catch (e, st) {
        print(e);
        print(st);
        // Handle JSON parsing errors
        request.response
          ..statusCode = HttpStatus.badRequest
          ..write('Error parsing JSON');
        await request.response.close();
      }
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Only POST requests are supported');
      await request.response.close();
    }

    return true;
  }
}
