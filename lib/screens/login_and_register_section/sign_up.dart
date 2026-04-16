import 'package:carpool_admin/utils/routing/routes.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/auth_back_button.dart';
import 'package:carpool_admin/widgets/buttons/auth_button.dart';
import 'package:carpool_admin/widgets/text_fields/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 35),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const AuthBackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: 666,
            height: 729,
            decoration: BoxDecoration(
              color: AppColors.authContainerColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 9.4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 86),
                    width: 514,
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: AppTextStyles.authContainerHeading,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Please Register to continue to your admin account.',
                          style: AppTextStyles.authContainerSubHeading,
                        ),
                        const SizedBox(height: 30),
                        const CustomAuthTextField(
                          label: "Email",
                          hintText: "Enter your Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomAuthTextField(
                          hintText: "Password",
                          isPassword: true,
                          suffixIcon: Image.asset(
                            'assets/icons/login_and_register/ic_eyeOff.png',
                            width: 20.0,
                            height: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomAuthTextField(
                          hintText: "Confirm Password",
                          isPassword: true,
                          suffixIcon: Image.asset(
                            'assets/icons/login_and_register/ic_eyeOff.png',
                            width: 20.0,
                            height: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.inputFocusBorder,
                                    width: 2.0,
                                  ),
                                ),
                                Text('Keep me logged in', style: AppTextStyles.loginRememberText)
                              ],
                            ),
                            // Updated this section for navigation
                            GestureDetector(
                              onTap: () => context.pushNamed('forgot-password'),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Forgot Password ?', 
                                  style: AppTextStyles.forgotPasswordText
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        AuthButton(
                          label: "Sign Up",
                          onTap: () {
                            context.go(AppRoutes.mainScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}