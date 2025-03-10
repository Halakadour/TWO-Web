import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';

class WorkingTimeCard extends StatefulWidget {
  const WorkingTimeCard({
    super.key,
  });

  @override
  State<WorkingTimeCard> createState() => _WorkingTimeCardState();
}

class _WorkingTimeCardState extends State<WorkingTimeCard> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> editMode = ValueNotifier<bool>(false);
    final TextEditingController controller =
        TextEditingController(text: "Sanday - Thursday 10:00 AM - 03:00 PM");
    FocusNode timeFocusNode = FocusNode();

    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
            color: const Color(0xFFC3D8F5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Compony woking time",
                  style: AppTextStyle.subtitle01(color: AppColors.blueShade3),
                ),
                ValueListenableBuilder(
                  valueListenable: editMode,
                  builder: (context, value, child) => Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          editMode.value = !editMode.value;
                          timeFocusNode.requestFocus();
                        },
                        icon: value
                            ? const Icon(
                                Iconsax.close_circle,
                                color: AppColors.rockshade1,
                              )
                            : const SizedBox(),
                      ),
                      IconButton(
                        onPressed: () {
                          editMode.value = !editMode.value;
                        },
                        icon: value
                            ? const Icon(
                                Iconsax.add_circle,
                                color: AppColors.blueShade2,
                              )
                            : const Icon(
                                Iconsax.edit,
                                color: AppColors.blueShade2,
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.calendar,
                      color: AppColors.blueShade2,
                    ),
                    PaddingConfig.w8,
                    SizedBox(
                      width: 500,
                      child: ValueListenableBuilder(
                        valueListenable: editMode,
                        builder: (context, value, child) => CustomTextFormField(
                          autofocus: value,
                          enabled: value,
                          focusNode: timeFocusNode,
                          labelText: "",
                          style: AppTextStyle.subtitle02(
                              color: AppColors.blueShade2),
                          controller: controller,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          validator: (p0) {
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
