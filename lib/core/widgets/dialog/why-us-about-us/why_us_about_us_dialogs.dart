import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/save_text_button.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';

class WhyUsAboutUsDialogs {
  // Add about Us
  Future<dynamic> addAboutUsDialog(
      BuildContext context,
      TextEditingController timeController,
      TextEditingController siteController) {
    return showDialog(
      context: context,
      builder: (context) => SizedBox(
        height: 100,
        child: AlertDialog(
          title: Text(
            "Create a new about us :",
            style: AppTextStyle.subtitle01(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                labelText: "work time",
                controller: timeController,
                validator: (p0) {
                  if (p0 == null) {
                    return "Add Text";
                  }
                  return null;
                },
              ),
              PaddingConfig.h8,
              CustomTextFormField(
                labelText: "work site",
                controller: siteController,
                validator: (p0) {
                  if (p0 == null) {
                    return "Add Text";
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            const CancelTextButton(),
            SaveTextButton(onPressed: () {
              context.read<AboutUsWhyUsBloc>().add(CreateAboutUsEvent(
                  workTime: timeController.text, site: siteController.text));
              context.pop();
            })
          ],
        ),
      ),
    );
  }

  // Add Why Us
  Future<dynamic> addWhyUsDialog(
      BuildContext context, TextEditingController controller) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Create Why Us Item :",
          style: AppTextStyle.subtitle01(),
        ),
        content: CustomTextFormField(
          labelText: "Label",
          controller: controller,
          validator: (p0) {
            if (p0 == null) {
              return "Add Text";
            }
            return null;
          },
        ),
        actions: [
          const CancelTextButton(),
          SaveTextButton(onPressed: () {
            context
                .read<AboutUsWhyUsBloc>()
                .add(CreateWhyUsEvent(whyUs: controller.text));
            context.pop();
          })
        ],
      ),
    );
  }
}
