import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool securePass = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login With Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'LOGIN SCREEN',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultTextField(
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill the email field';
                  }
                  return null;
                },
                controller: emailController,
                label: 'Email Address',
                prefix: Icons.email,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultTextField(
                  type: TextInputType.visiblePassword,
                  label: 'Password',
                  prefix: Icons.password_rounded,
                  controller: passwordController,
                  isPassword: securePass,
                  suffix: securePass ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                       securePass = !securePass;
                    });
                  },
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill the password field';
                    }
                    return null;
                  }),
              defaultButton(
                text: 'LOGIN',
                function: () {
                  if(formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
