import 'package:evently/core/appAssets.dart';
import 'package:evently/core/extensions/padding_ext.dart';
import 'package:evently/core/routes/pages_route_name.dart';
import 'package:evently/core/themes/app_colors.dart';
import 'package:evently/features/signUp/sign_up_view.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';


class SignInView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(AppAssets.splashLogo, height: 190),
              const SizedBox(height: 40),


              CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ).paddingAll(16),


              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ).paddingAll(16),

              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    navigatorKey.currentState!
                        .pushNamed(PagesRouteName.forgetPassword);
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ).paddingOnly(right: 16),
              ),


              ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState!
                        .pushNamed(PagesRouteName.homeScreen);
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ).paddingAll(16),

              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have Account? ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpView()),
                      );
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),


              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: AppColors.primaryColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: AppColors.primaryColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                ],
              ).paddingAll(16),


              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.googleIcon,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Login With Google',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
