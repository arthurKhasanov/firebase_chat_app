import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../widgets/circle_clipper.dart';
import '../widgets/sliding_container.dart';

// keep in touch all over the world

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  double height = 300;
  double opacity = 0.0;

  void _updateWidth() {
    setState(() {
      height = 365;
    });
  }

  void _updateOpacity() {
    setState(() {
      opacity = 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateWidth();
      _updateOpacity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 81, 56, 124),
                        Color.fromARGB(255, 90, 149, 251),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    ClipPath(
                      clipper: CircleClipper(),
                      child: AnimatedContainer(
                        color: Colors.white,
                        height: height,
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 3,
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 1000),
                          animatedTexts: [
                            TyperAnimatedText(''),
                            TyperAnimatedText(
                              'Keep in touch all over the world',
                              speed: const Duration(milliseconds: 30),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Sniglet',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Positioned(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Lottie.asset(
                            'assets/lottie_animations/conversation_lottie.json',
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: opacity,
                            child: Text(
                              'Chattie',
                              style: TextStyle(
                                fontFamily: 'Sniglet',
                                fontSize: 60,
                                foreground: Paint()
                                  ..shader = const LinearGradient(colors: [
                                    Color.fromARGB(255, 81, 56, 124),
                                    Color.fromARGB(255, 90, 149, 251),
                                  ]).createShader(
                                    const Rect.fromLTRB(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SlidingContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
