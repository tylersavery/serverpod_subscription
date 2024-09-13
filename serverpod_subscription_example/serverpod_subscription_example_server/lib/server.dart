import 'package:serverpod/serverpod.dart';

import 'package:serverpod_subscription_example_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:serverpod_subscription_server/serverpod_subscription_server.dart' as sub;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  pod.webServer.addRoute(sub.RouteAppleWebhook(), '/webhook/apple');
  pod.webServer.addRoute(sub.RouteAppleWebhook(), '/webook/apple');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(
    auth.AuthConfig(sendValidationEmail: (session, email, validationCode) async {
      print("CODE: $validationCode");
      return true;
    }, sendPasswordResetEmail: (session, user, validationCode) async {
      print("CODE: $validationCode");

      return true;
    }),
  );

  // Start the server.
  await pod.start();
}
