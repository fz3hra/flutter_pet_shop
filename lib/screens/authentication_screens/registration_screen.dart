import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/utils/extensions/navigator_extensions_utils.dart';
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
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  //  end of text editing controllers
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
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
                controller: usernameTextField,
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
              ),
              const Gap(8),
              AuthTextFieldWidget(
                controller: passwordTextField,
                hintText: 'xxxx',
                labelText: 'Password',
                obscureText: true,
                icon: IconConstants.passIcon,
                suffixIcon: IconConstants.unViewPasswordIcon,
              ),
              const Gap(24),
              GestureDetector(
                onTap: () =>
                    context.pushNamedNavigator(context, Routes.homeScreen),
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
                onTap: () =>
                    context.pushNamedNavigator(context, Routes.loginScreen),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
