import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      ),
      initialRoute: AppRoutes.route.homePage,
      routes: AppRoutes.route.routes,
    );
  }
}
