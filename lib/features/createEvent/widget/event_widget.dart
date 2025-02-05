import 'package:evently/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class EventCategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const EventCategorySelector({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryButton('Book Club', Icons.menu_book),
        _buildCategoryButton('Sport', Icons.sports_handball_sharp),
        _buildCategoryButton('Birthday', Icons.cake),
      ],
    );
  }

  Widget _buildCategoryButton(String category, IconData icon) {
    return GestureDetector(
      onTap: () => onCategorySelected(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selectedCategory == category
              ? AppColors.primaryColor
              : Colors.transparent,
          border: Border.all(
            color: selectedCategory == category
                ? AppColors.primaryColor
                : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selectedCategory == category
                  ? Colors.white
                  : AppColors.primaryColor,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              category,
              style: TextStyle(
                color: selectedCategory == category
                    ? Colors.white
                    : AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
