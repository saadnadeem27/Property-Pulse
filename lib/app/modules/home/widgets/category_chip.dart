import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../home_screen.dart';

class CategoryChip extends StatefulWidget {
  final CategoryItem category;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: widget.category.isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.category.isSelected ? AppColors.primary : AppColors.border,
          ),
          boxShadow: widget.category.isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.category.icon,
              size: 16,
              color: widget.category.isSelected 
                  ? Colors.white 
                  : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              widget.category.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: widget.category.isSelected 
                    ? Colors.white 
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}