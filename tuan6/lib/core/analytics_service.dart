import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics analytics =
      FirebaseAnalytics.instance;

  static Future<void> logLogin(String method) async {
    await analytics.logLogin(loginMethod: method);
  }

  static Future<void> logScreen(String screenName) async {
    await analytics.logScreenView(
      screenName: screenName,
    );
  }

  static Future<void> logButton(String name) async {
    await analytics.logEvent(
      name: 'button_click',
      parameters: {
        'button_name': name,
      },
    );
  }
}
