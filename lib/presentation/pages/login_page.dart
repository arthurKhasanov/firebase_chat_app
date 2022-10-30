import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../widgets/circle_clipper.dart';
import '../widgets/login_form_container.dart';

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
                    const Text(
                      'Keep in touch all over the world',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sniglet',
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
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

class SlidingContainer extends StatefulWidget {
  const SlidingContainer({super.key});

  @override
  State<SlidingContainer> createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  double _opacity = 0.0;

  void _updateOpacity() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _offset = Tween(begin: const Offset(0.0, 0.8), end: const Offset(0, 0.62))
        .animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateOpacity();
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: const LoginFormContainer(),
      ),
    );
  }
}
