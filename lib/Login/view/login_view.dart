import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../Widget/btn.dart';
import '../../../Widget/textfeild.dart';
import '../../Home/view/home.dart';
import '../../Splash/Controller/splash_controller.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();

  final RegExp numReg = RegExp(r".*[0-9].*");
  final RegExp letterReg = RegExp(r".*[A-Za-z].*");

  @override
  Widget build(BuildContext context) {
    final providerController =
        Provider.of<SplashProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text(
          'Register',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: providerController.name,
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Name!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      hintText: '',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: providerController.name,
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Name!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      hintText: '',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: providerController.email,
                      prefixIcon: Icons.alternate_email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hintText: '',
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: providerController.password,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      validator: (String? password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter your password';
                        }

                        if (password.length < 6) {
                          return 'Your password is too short';
                        } else if (password.length < 8) {
                          return 'Your password is acceptable but not strong';
                        }
                        if (!letterReg.hasMatch(password) ||
                            !numReg.hasMatch(password)) {
                          return 'Add special Character and Captial and small Alphabet ';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      hintText: '',
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Row(
                children: [
                  AppButton(
                    text: ("Sign Up"),
                    width: MediaQuery.sizeOf(context).width * 0.89,
                    onPressed: () async {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
