import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: AppTextStyle.bodySm(
          color: selected ? AppColors.black : AppColors.iconColor,
        ),
      ),
      selected: selected,
      onSelected: (_) => onSelected(),
      side: BorderSide(
        color: selected ? Colors.transparent : AppColors.iconColor,
      ),
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.greenShade2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
