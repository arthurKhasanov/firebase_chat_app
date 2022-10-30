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
  bool abscureText = true;

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
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                validator: (value) {
                  if (value == null) return 'Enter your e-mail';
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)
                      ? null
                      : "Please enter a valid email";
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: abscureText,
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
                      suffixIcon: IconButton(
                        icon: abscureText
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          setState(() {
                            abscureText = !abscureText;
                          });
                        },
                      ),
                    ),
                validator: (value) {
                  if (value == null) return 'Enter your password';
                  return value.length < 6
                      ? "Password must be at least 6 characters"
                      : null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    logIn();
                  },
                  child: const Text('Log In'))
            ],
          ),
        ),
      ),
    );
  }

  logIn() {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {}
  }
}
