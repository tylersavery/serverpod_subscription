import 'package:serverpod/serverpod.dart';
import 'package:serverpod_subscription_server/serverpod_subscription_server.dart';

class AppleEndpoint extends Endpoint {
  Future<bool> handlePurchase(Session session, AppPurchaseDetails details) async {
    return true;
  }
}
