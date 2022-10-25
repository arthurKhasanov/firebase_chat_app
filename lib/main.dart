import 'package:firebase_chat_app/core/constants/firebase_constants.dart';
import 'package:firebase_chat_app/core/theme_data.dart';
import 'package:firebase_chat_app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'halper/helper.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: FirebaseConstants.apiKey,
        appId: FirebaseConstants.appId,
        messagingSenderId: FirebaseConstants.messagingSenderId,
        projectId: FirebaseConstants.projectId,
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await Helper.getUserLoggedInStatus().then((value) {
      if (value != null) {
        isSignedIn = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
