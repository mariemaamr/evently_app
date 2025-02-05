import 'package:evently/core/appAssets.dart';
import 'package:evently/core/extensions/padding_ext.dart';
import 'package:evently/core/extensions/validation.dart';
import 'package:evently/core/routes/pages_route_name.dart';
import 'package:evently/core/themes/app_colors.dart';
import 'package:evently/features/signUp/sign_up_view.dart';
import 'package:evently/main.dart';
import 'package:evently/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../services/firebase_auth.dart';
import '../../widgets/custom_text_field.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        EasyLoading.showInfo("Google Sign-In canceled.");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      EasyLoading.showSuccess("Welcome ${userCredential.user?.displayName}!");
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        PagesRouteName.homeScreen,
            (route) => false,
      );
    } catch (e) {
      EasyLoading.showError("Google Sign-In failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.isValidEmail()) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ).paddingAll(16),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (!value.isValidPassword()) {
                      return 'Password must be at least 6 characters, include an uppercase letter, a lowercase letter, and a number';
                    }
                    return null;
                  },
                ).paddingAll(16),
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
                    if (_formKey.currentState?.validate() ?? false) {
                      FireBaseAuth.login(
                        emailController.text,
                        passwordController.text,
                      ).then((value) {
                        if (value) {
                          EasyLoading.dismiss();
                          navigatorKey.currentState!.pushNamedAndRemoveUntil(
                            PagesRouteName.homeScreen,
                                (route) => false,
                          );
                        }
                      });
                    }
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
                          MaterialPageRoute(
                              builder: (context) => SignUpView()),
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
                  onPressed: signInWithGoogle,
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
      ),
    );
  }
}
