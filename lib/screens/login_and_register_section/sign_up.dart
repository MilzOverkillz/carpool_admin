import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/auth_back_button.dart';
import 'package:carpool_admin/widgets/buttons/auth_button.dart';
import 'package:carpool_admin/widgets/text_fields/custom_auth_text_field.dart';
import 'package:flutter/material.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
            decoration: BoxDecoration(color: AppColors.authContainerColor, borderRadius: BorderRadius.circular(25), boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.25), 
        offset: const Offset(0, 4),            
        blurRadius: 9.4,                       
        spreadRadius: 0,                       
      ),
    ],),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 86),
                  width: 514,
                  height: 371,
                  child: Column(
                    children: [
                      Text('Sign in', style: AppTextStyles.authContainerHeading,),
                      SizedBox(height: 14,),
                      Text('Please login to continue to your admin account.', style: AppTextStyles.authContainerSubHeading,),
                      SizedBox(height: 30,),
                      CustomAuthTextField(
                        label: "Email",
                        hintText: "Enter your Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 24),
                      CustomAuthTextField(
                        hintText: "Password",
                        isPassword: true,
                        suffixIcon: Image.asset('assets/icons/login_and_register/ic_eyeOff.png', ),
                      ),
                      const SizedBox(height: 32),
                      AuthButton(
                        label: "Sign in",
                        onTap: () {
                          // Your logic here
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
