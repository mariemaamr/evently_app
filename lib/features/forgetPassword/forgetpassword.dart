import 'package:evently/core/appAssets.dart';
import 'package:evently/core/extensions/padding_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';

class ForgetPasswordView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Forget Password"),
       centerTitle: true,
     ),
     body: Column(
       children: [
     Image.asset(AppAssets.forgetPassword),
SizedBox(height: 20),
         TextFormField(
           decoration: InputDecoration(
             hintText: "Email",
             prefixIcon: Icon(Icons.email, color: Colors.grey),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10),
             ),
           ),
         ).paddingAll(16),

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
         '  Reset Password',
         style: TextStyle(
           color: Colors.white,
           fontSize: 18,
         ),
       ),
     ).paddingAll(16),
     ],
     ),
   );
  }

}