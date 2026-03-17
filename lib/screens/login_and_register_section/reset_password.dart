import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/auth_button.dart';
import 'package:carpool_admin/widgets/text_fields/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 100),
            width: 514,
            height: 456,
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: AppTextStyles.authContainerHeading,
                ),
                SizedBox(height: 14),
                Text(
                  'Please login to continue to your admin account.',
                  style: AppTextStyles.authContainerSubHeading,
                ),
                SizedBox(height: 43),
                SizedBox(
                  width: 510,
                  height: 153,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAuthTextField(
                        label: 'New Password',
                        hintText: "Password",
                        isPassword: true,
                        suffixIcon: Image.asset(
                          'assets/icons/login_and_register/ic_eyeOff.png',
                          width: 20.0,
                          height: 20,
                        ),
                      ),
                      CustomAuthTextField(
                        hintText: "Confirm new password",
                        isPassword: true,
                        suffixIcon: Image.asset(
                          'assets/icons/login_and_register/ic_eyeOff.png',
                          width: 20.0,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                    Text(
                      'Keep me logged in',
                      style: AppTextStyles.loginRememberText,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AuthButton(
                  label: "Confirm Password",
                  onTap: () {
                    context.pushReplacementNamed('sign-in');
                  },
                ),
                SizedBox(height: 26),
                GestureDetector(
                  onTap: () => context.pushReplacementNamed('sign-in'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Back to ',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.authSubHeading,
                        ),
                      ),
                      Text(
                        'login',
                        style: TextStyle(
                          fontFamily: AppFonts.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff6C6C6C),
                        ),
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
