import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_website/core/widgets/buttons/desmiss_elevated_buttom.dart';
import 'package:two_website/core/widgets/buttons/save_elevated_button.dart';
import 'package:two_website/core/widgets/images/fetch_image_box.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/services/presentation/bloc/service_bloc.dart';

class CreateServiceForm extends StatefulWidget {
  const CreateServiceForm({super.key});

  @override
  State<CreateServiceForm> createState() => _CreateServiceFormState();
}

class _CreateServiceFormState extends State<CreateServiceForm> {
  late final GlobalKey<FormState> _formkey;
  late final TextEditingController _serviceTitleController;
  late final TextEditingController _serviceDescController;
  String? imageBytes;
  void updateImageBytes(String? bytes) {
    setState(() {
      imageBytes = bytes;
    });
  }

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _serviceTitleController = TextEditingController();
    _serviceDescController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceBloc, ServiceState>(
      listener: (context, state) {
        createServiceStateHandling(state, context);
      },
      listenWhen: (previous, current) =>
          previous.createServiceStatus != current.createServiceStatus,
      child: PageTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Breadcrumbs(
              paths: [
                AppRouteConfig.dashboard,
                AppRouteConfig.services,
                AppRouteConfig.createService
              ],
              pages: ["Dashboard", "Services", "Create Service"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                PaddingConfig.w8,
                Text(
                  "Create Service",
                  style: AppTextStyle.heading04(),
                )
              ],
            ),
            PaddingConfig.h24,
            SizedBox(
              height: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(SizesConfig.md),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                              SizesConfig.borderRadiusMd)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Basic Information",
                              style: AppTextStyle.subtitle03(),
                            ),
                            PaddingConfig.h16,
                            CustomTextFormField(
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.gray, width: .7),
                                  borderRadius: BorderRadius.circular(
                                      SizesConfig.cardRadiusMd)),
                              labelText: 'Service Title',
                              controller: _serviceTitleController,
                              validator: (p0) {
                                if (p0 != null) {
                                  return null;
                                } else {
                                  return TextStrings.fieldValidation;
                                }
                              },
                            ),
                            PaddingConfig.h16,
                            CustomTextFormField(
                              maxLines: 6,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.gray, width: .7),
                                  borderRadius: BorderRadius.circular(
                                      SizesConfig.cardRadiusMd)),
                              labelText: 'Service Description',
                              controller: _serviceDescController,
                              validator: (p0) {
                                if (p0 != null) {
                                  return null;
                                } else {
                                  return TextStrings.fieldValidation;
                                }
                              },
                            ),
                            PaddingConfig.h16,
                          ],
                        ),
                      ),
                    ),
                  ),
                  PaddingConfig.w16,
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(SizesConfig.md),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                                SizesConfig.borderRadiusMd)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Image",
                              style: AppTextStyle.subtitle03(),
                            ),
                            PaddingConfig.h16,
                            FetchImageBox(
                              imageB64: imageBytes,
                              onUpdate: updateImageBytes,
                            ),
                            PaddingConfig.h16,
                          ],
                        ),
                      )),
                ],
              ),
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DesmissElevatedButtom(),
                PaddingConfig.w16,
                SaveElevatedButton(onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    if (imageBytes == null) {
                      CustomQuickAlert().addImageAlert(context);
                    } else {
                      context.read<ServiceBloc>().add(CreateServiceEvent(
                          title: _serviceTitleController.text,
                          description: _serviceDescController.text,
                          image: imageBytes!));
                    }
                  }
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  void createServiceStateHandling(ServiceState state, BuildContext context) {
    if (state.createServiceStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createServiceStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<PostBloc>().add(GetActivePostsEvent());
      context.pop();
    } else if (state.createServiceStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createServiceStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
