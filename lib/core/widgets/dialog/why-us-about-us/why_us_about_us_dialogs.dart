import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/save_text_button.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';

class AboutUsWhyUsDialogs {
  // Create about Us
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

  // Update About Us
  Future<dynamic> updateAboutUsDialog(
      BuildContext context,
      TextEditingController timeController,
      TextEditingController siteController,
      int id) {
    return showDialog(
      context: context,
      builder: (context) => SizedBox(
        height: 100,
        child: AlertDialog(
          title: Text(
            "Update about us :",
            style: AppTextStyle.subtitle01(color: AppColors.blueShade2),
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
              print(" The id is $id");
              print(" The work time is ${timeController.text}");
              print(" The site is ${siteController.text}");
              context.read<AboutUsWhyUsBloc>().add(UpdateAboutUsEvent(
                  aboutUsEntity: AboutUsEntity(
                      aboutId: id,
                      aboutWorkTime: timeController.text,
                      aboutSite: siteController.text)));
              context.pop();
            })
          ],
        ),
      ),
    );
  }

  // Create Why Us
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

// update why us
  Future<dynamic> updateWhyUsDialog(
      BuildContext context, TextEditingController controller, int id) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Update Why Us Item :",
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
                .add(UpdateWhyUsEvent(whyUsId: id, whyUs: controller.text));
            context.pop();
          })
        ],
      ),
    );
  }
}
