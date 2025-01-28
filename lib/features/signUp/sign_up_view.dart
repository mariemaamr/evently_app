import 'package:evently/core/appAssets.dart';
import 'package:evently/core/extensions/padding_ext.dart';
import 'package:evently/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).paddingAll(16),

              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).paddingAll(16),

              // Password Field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).paddingAll(16),

              // Confirm Password Field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Re Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).paddingAll(16),

              const SizedBox(height: 10),

              // Create Account Button
              ElevatedButton(
                onPressed: () {},
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

              // Login Prompt
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
    );
  }
}

