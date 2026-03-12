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
          leading: AuthBackButton(),
          backgroundColor: Colors.transparent,
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 86),
                  width: 514,
                  height: 449,
                  child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: AppTextStyles.authContainerHeading,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Please Register  to continue to your admin account.',
                        style: AppTextStyles.authContainerSubHeading,
                      ),
                      SizedBox(height: 30),
                      CustomAuthTextField(
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
                                // Matches the black primary color in your design
                                activeColor: Colors.black,
                                checkColor: Colors.white,
                                // Custom shape to match the 25px radius theme
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ), // Slightly rounded corners
                                ),
                                side: const BorderSide(
                                  color: AppColors.inputFocusBorder,
                                  width: 2.0,
                                ),
                              ),
                              Text('Keep me logged in', style: AppTextStyles.loginRememberText,)
                            ],
                          ),
                          Text('Fogot Password ?', style: AppTextStyles.forgotPasswordText,)
                        ],
                      ),
                      SizedBox(height: 12,),
                      AuthButton(
                        label: "Sign Up",
                        onTap: () {
                          context.pushNamed('verification');
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
    );
  }
}
