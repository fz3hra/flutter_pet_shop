import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_app/config/routes.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/utils/util_exports.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final storage = new FlutterSecureStorage();

  // start of texteditingcontrollers
  TextEditingController usernameTextField = TextEditingController(text: '');
  TextEditingController passwordTextField = TextEditingController(text: '');
  //  end of text editing controllers

  // start of form key
  final _formKey = GlobalKey<FormState>();
  // end of form key

  // start of bool values
  bool isRemember = false;
  bool isShowPassword = false;
  // end of bool values

  String test = "";
  Future<void> readSecureData() async {
    usernameTextField.text = await storage.read(key: 'emailLogin') ?? '';
    passwordTextField.text = await storage.read(key: 'passwordLogin') ?? '';
  }

  Future<void> deleteKey() async {
    await storage.deleteAll();
  }

  @override
  void initState() {
    super.initState();
    // deleteKey();
    readSecureData();
  }

  // dispose method
  @override
  void dispose() {
    // TODO: implement dispose
    usernameTextField.dispose();
    passwordTextField.dispose();
    super.dispose();
  }

  // button submit
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (isRemember == true) {
        await storage.write(key: 'emailLogin', value: usernameTextField.text);
        await storage.write(
            key: 'passwordLogin', value: passwordTextField.text);
      }
      if (mounted) context.pushNamedNavigator(context, Routes.homeScreen);
    }
  }
  // end of button submit

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
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
                              size: const Size.fromRadius(40),
                              child: Image.asset(
                                ImageConstants.authTopImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Gap(40),
                          Center(
                            child: Text(
                              "Login",
                              style: FontConstants.authTexts.titleLarge,
                            ),
                          ),
                          const Gap(8),
                          Center(
                            child: Text(
                              "Enter your email and password",
                              style: FontConstants.authTexts.titleSmall,
                            ),
                          ),
                          const Gap(24),
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
                          const Gap(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // TODO: persist state using secured storage when remember me
                                  CupertinoSwitch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        isRemember = value;
                                      });
                                    },
                                    value: isRemember,
                                  ),
                                  const Text(
                                    "Remember",
                                    style: TextStyle(
                                      fontFamily: 'poppins_semi_bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Forget password!",
                                style: TextStyle(
                                  color: ColorConstants.red,
                                  fontFamily: 'poppins_regular',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const Gap(24),
                          GestureDetector(
                            onTap: _submit,
                            child: FullWidthButtonWidget(
                              buttonName: 'Sign In',
                            ),
                          ),
                          const Gap(16),
                          GestureDetector(
                            onTap: () => context.pushNamedNavigator(
                                context, Routes.registerScreen),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "Don't have an account?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'poppins_regular',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' signUp',
                                        style: TextStyle(
                                          color: ColorConstants.red,
                                          fontFamily: 'poppins_regular',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_right,
                                  color: ColorConstants.red,
                                )
                              ],
                            ),
                          ),
                          const Gap(24),
                          Expanded(
                            child: Image.asset(
                              ImageConstants.loginBottomImage,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
