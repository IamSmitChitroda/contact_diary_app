import 'headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  List<String> name = sharedPreferences.getStringList('name') ?? [];
  List<String> number = sharedPreferences.getStringList('number') ?? [];
  List<String> email = sharedPreferences.getStringList('email') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactController(
            sp: sharedPreferences,
            name: name,
            number: number,
            email: email,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => StepperController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
