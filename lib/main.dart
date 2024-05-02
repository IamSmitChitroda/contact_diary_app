import 'headers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactController()),
      ],
      child: const MyApp(),
    ),
  );
}
