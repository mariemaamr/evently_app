import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';

class CustomTabBarItem extends StatelessWidget{
  final String title;
  final IconData icon;
  final bool isSelected;

  const CustomTabBarItem({super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) ;
  @override
  Widget build(BuildContext context) {
    return  Container(
    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
    decoration:BoxDecoration(
    color: isSelected?Colors.white:Colors.transparent,
    borderRadius: BorderRadius.circular(16),
      border:Border.all(
        color: Colors.white
      )

    ),
    child: Row(
    children: [
    Icon(icon,
    color: isSelected?AppColors.primaryColor:Colors.white),
    Text(title
      ,style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: isSelected?AppColors.primaryColor:Colors.white
    ),
    ),
    ],
    ),
    );
  }
  
}