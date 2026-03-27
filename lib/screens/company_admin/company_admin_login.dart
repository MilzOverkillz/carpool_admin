import 'package:carpool_admin/utils/routing/routes.dart'; // IMPORTED
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/buttons/auth_back_button.dart';
import 'package:carpool_admin/widgets/buttons/auth_button.dart';
import 'package:carpool_admin/widgets/text_fields/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompanyAdminLogin extends StatefulWidget {
  const CompanyAdminLogin({super.key});

  @override
  State<CompanyAdminLogin> createState() => _CompanyAdminLoginState();
}

class _CompanyAdminLoginState extends State<CompanyAdminLogin> {
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
            child: SingleChildScrollView( // Added for responsiveness
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 86),
                    width: 514,
                    child: Column(
                      children: [
                        Text(
                          'Company Admin Portal',
                          style: AppTextStyles.authContainerHeading,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Sign into manage your company's carpool account",
                          style: AppTextStyles.authContainerSubHeading,
                        ),
                        const SizedBox(height: 64),
                        const CustomAuthTextField(
                          label: "Company Email",
                          hintText: "Enter your Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 50),
                        CustomAuthTextField(
                          label: "Password",
                          hintText: "Password",
                          isPassword: true,
                          suffixIcon: Image.asset(
                            'assets/icons/login_and_register/ic_eyeOff.png',
                            width: 20.0,
                            height: 20,
                          ),
                        ),
                        const SizedBox(height: 64),
                        AuthButton(
                          label: "Sign in",
                          onTap: () {
                            context.pushNamed('company-admin-dashboard');
                          },
                        ),
                        const SizedBox(height: 26),
                        
                        // Updated Back Button
                        GestureDetector(
                          onTap: () {
                            context.go(AppRoutes.portalSelection);
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              'Back', 
                              style: TextStyle(
                                fontFamily: AppFonts.primary, 
                                fontSize: 18, 
                                fontWeight: FontWeight.w400, 
                                color: const Color(0xff6c6c6c),
                                decoration: TextDecoration.underline, // Visual cue
                              ),
                            ),
                          ),
                        )
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