import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/auth_button.dart';
import 'package:carpool_admin/widgets/text_fields/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                margin: EdgeInsets.only(top: 156),
                padding: EdgeInsets.symmetric(horizontal: 100),
                width: 510,
                height: 396,
                child: Column(
                  children: [
                    Text('Forgot Password', style: AppTextStyles.authContainerHeading,),
                    SizedBox(height: 14,),
                    Text('Enter your email address and we will send you a verification code to reset your password', style:AppTextStyles.authContainerSubHeading, textAlign: TextAlign.center,),
                    SizedBox(height: 55,),
                    CustomAuthTextField(
                        label: "Email",
                        hintText: "Enter your Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 77,),
                      AuthButton(
                        label: "Reset Password",
                        onTap: () {
                          context.pushReplacementNamed('reset-password');
                        },
                      ),
                      SizedBox(height: 26,),
                      GestureDetector(
                        onTap:() => context.pushReplacementNamed('sign-in'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Back to ', style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w400, fontSize: 18,color: AppColors.authSubHeading ),),
                            Text('login', style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff6C6C6C)),),
                          ],
                        ),
                      )
                  ],
                ),
              ),
        ),
      ),
    );
  }
}