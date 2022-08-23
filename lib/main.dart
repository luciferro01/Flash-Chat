import 'package:flutter/material.dart';
import 'package:flash_chat_application/screens/welcome_screen.dart';
import 'package:flash_chat_application/screens/login_screen.dart';
import 'package:flash_chat_application/screens/registration_screen.dart';
import 'package:flash_chat_application/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // WidgetsFlutterBinding.ensureInitialized();
    const FlashChat(),
  );
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          // body: TextStyle(color: Colors.black54),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.ied: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
