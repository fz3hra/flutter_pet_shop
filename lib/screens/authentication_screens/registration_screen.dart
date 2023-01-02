import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/utils/util_exports.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:gap/gap.dart';

import '../../config/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // start of texteditingcontrollers
  TextEditingController nameTextField = TextEditingController();
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  //  end of text editing controllers

  // bool values
  bool isShowPassword = false;
  // end of values

  // form key
  final _formKey = GlobalKey<FormState>();
  // end of form key

  // button submit
  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.pushNamedNavigator(context, Routes.homeScreen);
    }
  }
  // end of button submit

  // dispose method
  @override
  void dispose() {
    nameTextField.dispose();
    usernameTextField.dispose();
    passwordTextField.dispose();
    super.dispose();
  }
  // end of dispse method

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Gap(24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40),
                            child: Image.asset(
                              ImageConstants.authTopImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Gap(40),
                        Center(
                          child: Text(
                            "Sign Up",
                            style: FontConstants.authTexts.titleLarge,
                          ),
                        ),
                        const Gap(8),
                        Center(
                          child: Text(
                            "Enter your credentials to continue",
                            style: FontConstants.authTexts.titleSmall,
                          ),
                        ),
                        const Gap(24),
                        AuthTextFieldWidget(
                          controller: nameTextField,
                          hintText: 'Zaahra Dev',
                          labelText: 'Name',
                          obscureText: false,
                          icon: IconConstants.personIcon,
                        ),
                        const Gap(8),
                        AuthTextFieldWidget(
                          controller: usernameTextField,
                          hintText: 'fz3hra@gmail.com',
                          labelText: 'Email or Username',
                          obscureText: false,
                          icon: IconConstants.emailIcon,
                          validator: (emailValidator) {
                            if (emailValidator!.emailErrorText == false)
                              return 'Email address should be as example@gmail.com';
                          },
                        ),
                        const Gap(8),
                        AuthTextFieldWidget(
                          controller: passwordTextField,
                          hintText: 'xxxx',
                          labelText: 'Password',
                          obscureText: isShowPassword == true ? false : true,
                          icon: IconConstants.passIcon,
                          suffixIcon: AuthShowPasswordWidget(
                            showpassword: (showPassword) {
                              setState(() {
                                isShowPassword = showPassword;
                              });
                            },
                          ),
                          validator: (passwordValidator) {
                            if (passwordValidator!.passErrorText == false)
                              return 'minimum 8 characters and 1 capital letter required';
                          },
                        ),
                        const Gap(24),
                        GestureDetector(
                          onTap: _submit,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: ColorConstants.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: FontConstants.authTexts.labelSmall,
                            ),
                          ),
                        ),
                        const Gap(16),
                        GestureDetector(
                          onTap: () => context.pushNamedNavigator(
                              context, Routes.loginScreen),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'poppins_regular',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Sign In',
                                      style: TextStyle(
                                        color: ColorConstants.red,
                                        fontFamily: 'poppins_regular',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: ColorConstants.red,
                              )
                            ],
                          ),
                        ),
                        const Gap(24),
                        Expanded(
                          child: Image.asset(
                            ImageConstants.registrationBottomImage,
                            height: 160,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
