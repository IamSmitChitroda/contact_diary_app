import 'package:countact_diary_app/headers.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes route = AppRoutes._();
  String homePage = '/';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomePage(),
  };
}
