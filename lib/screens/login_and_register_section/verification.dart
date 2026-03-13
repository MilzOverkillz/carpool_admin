import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/verify_action.dart';
import 'package:carpool_admin/widgets/text_fields/otp_input_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    String email = 'Knightowl@gmail.com';
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
            margin: EdgeInsets.only(top: 98),
            width: 403,
            child: Column(
              children: [
                Text(
                  'Enter Verification code',
                  style: AppTextStyles.verificationHeadingText,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We've sent code to ",
                      style: AppTextStyles.authContainerSubHeading,
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontFamily: AppFonts.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 440,
                  height: 110,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInputField(
                            controller: TextEditingController(),
                            first: true,
                          ),
                          OtpInputField(controller: TextEditingController()),
                          OtpInputField(controller: TextEditingController()),
                          OtpInputField(
                            controller: TextEditingController(),
                            last: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't get a code? ",
                            style: TextStyle(
                              fontFamily: AppFonts.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF969696).withOpacity(0.50),
                            ),
                          ),
                          Text(
                            "Click to resend",
                            style: TextStyle(
                              fontFamily: AppFonts.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF494949).withOpacity(0.70),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthActionButton(
                      text: "Cancel",
                      isSolid: false,
                      onPressed: () => context.pushReplacementNamed('sign-in'),
                    ),
                    const SizedBox(width: 20), // Spacing between buttons
                    AuthActionButton(
                      text: "Verify",
                      isSolid: true,
                      onPressed: () {
                        // Your verification logic
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
