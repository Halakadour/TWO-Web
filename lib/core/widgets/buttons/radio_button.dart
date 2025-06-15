import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key,
      required this.role,
      required this.selcetedRole,
      required this.label,
      required this.onChanged});
  final ValueNotifier<RoleModel> role;
  final ValueNotifier<RoleModel?> selcetedRole;
  final String label;
  final void Function(RoleModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selcetedRole,
      builder: (context, selcetedRoleValue, child) => Row(
        children: [
          Radio<RoleModel>(
              value: role.value,
              groupValue: selcetedRoleValue,
              activeColor: AppColors.greenShade2,
              onChanged: onChanged),
          Text(label,
              style: AppTextStyle.bodyMd(
                  color: (role.value == selcetedRoleValue)
                      ? AppColors.greenShade2
                      : AppColors.fontDarkColor)),
        ],
      ),
    );
  }
}
