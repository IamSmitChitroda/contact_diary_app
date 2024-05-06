import 'package:countact_diary_app/headers.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes route = AppRoutes._();
  String homePage = '/';
  String addContactPage = 'addContactPage';
  String contactInfoPage = 'contactInfoPage';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomePage(),
    'addContactPage': (context) => AddContactPage(),
    'contactInfoPage': (context) => const ContactInfoPage(),
  };
}
