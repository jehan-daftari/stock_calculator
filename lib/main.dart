import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'providers/stock_provider.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => StockProvider()),
      ],
      child: MaterialApp(
        title: 'Stock Return Calculator',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(0xFF2E4052),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color(0xFFFFC857), // Set accent color
          ),
          scaffoldBackgroundColor: Color(0xFFBDD9BF),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        /* initialRoute: '/', // Comment out initialRoute
        routes: {
          '/': (context) => LoginScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
        },*/
        home: HomeScreen(), // Directly set the home screen//
      ),
    );
  }
}
