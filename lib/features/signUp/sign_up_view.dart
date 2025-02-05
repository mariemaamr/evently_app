import 'package:evently/core/appAssets.dart';
import 'package:evently/core/extensions/padding_ext.dart';
import 'package:evently/core/extensions/validation.dart';
import 'package:evently/core/themes/app_colors.dart';
import 'package:evently/services/firebase_auth.dart';
import 'package:evently/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../main.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the formKey to the Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.splashLogo,
                  height: 150,
                ),
                const SizedBox(height: 30),


                TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ).paddingAll(16),


                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.isValidEmail()) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ).paddingAll(16),


                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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

                TextFormField(
                  controller: _rePasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Re-Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordcontroller.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ).paddingAll(16),

                const SizedBox(height: 10),



                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      FireBaseAuth.createAccount(
                        _emailcontroller.text,
                        _passwordcontroller.text,
                      ).then((value) {
                        EasyLoading.dismiss();
                        if (value == true) {
                          navigatorKey.currentState?.pop();
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
                    'Create Account',
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
                      "Already Have Account? ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/US.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/EG.png",
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
