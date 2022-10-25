import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

// keep in touch all over the world

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          decoration: (const InputDecoration())
                              .applyDefaults(
                                  Theme.of(context).inputDecorationTheme)
                              .copyWith(
                                hintText: 'E-mail',
                              ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          decoration: (const InputDecoration())
                              .applyDefaults(
                                  Theme.of(context).inputDecorationTheme)
                              .copyWith(
                                hintText: 'Password',
                              ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              debugPrint('s');
                            },
                            child: const Text('Log In'))
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Lottie.asset(
                              'assets/lottie_animations/conversation_lottie.json',
                              width: MediaQuery.of(context).size.width),
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
                                    Color.fromARGB(255, 90, 149, 251)
                                  ]).createShader(
                                    const Rect.fromLTRB(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstStart = Offset(70, size.height);
    var firstEnd = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - 70, size.height);
    var secondEnd = Offset(size.width, size.height - 50);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
