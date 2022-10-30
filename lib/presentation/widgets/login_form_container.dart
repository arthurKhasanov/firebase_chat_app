import 'package:flutter/material.dart';

class LoginFormContainer extends StatefulWidget {
  const LoginFormContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormContainer> createState() => _LoginFormContainerState();
}

class _LoginFormContainerState extends State<LoginFormContainer> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
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
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
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
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
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
      ),
    );
  }
}
