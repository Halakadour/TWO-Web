import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

class FillClientProfileBody extends StatefulWidget {
  const FillClientProfileBody({super.key});

  @override
  State<FillClientProfileBody> createState() => _FillClientProfileBodyState();
}

class _FillClientProfileBodyState extends State<FillClientProfileBody> {
  RoleModel? selectedItem;
  Uint8List? imageBytes;
  File? imageFile;

  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesEvent());
    super.didChangeDependencies();
  }

  Future<void> _getImageFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          setState(() async {
            imageFile = File(value.path);
            imageBytes = await value.readAsBytes();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TextStrings.fillProfile,
          style: AppTextStyle.subtitle01(),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
                width: 130,
                height: 130,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.fieldColor,
                ),
                child: imageBytes != null
                    ? Image.network(
                        imageFile!.path,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Iconsax.image)),
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: AppColors.darkGreenColor,
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder()),
                onPressed: () {
                  _getImageFile();
                },
                icon: const Icon(
                  Iconsax.camera,
                  color: AppColors.whiteColor,
                ))
          ],
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.fieldColor,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                IconsPath.work,
                width: 20,
              ),
              PaddingConfig.w20,
              BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                buildWhen: (previous, current) =>
                    (previous.roleListStatus != current.roleListStatus),
                builder: (context, state) {
                  if (state.roleListStatus == CasualStatus.success) {
                    selectedItem = state.roleList[0];
                    return Text(state.roleList[0].role);
                  } else if (state.roleListStatus == CasualStatus.loading) {
                    return const CircularProgressIndicator();
                  } else if (state.roleListStatus == CasualStatus.failure) {
                    return Text(state.message);
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomCartoonButton(
            title: TextStrings.tcontinue,
            isHover: ValueNotifier(false),
            onTap: () {
              if (imageBytes == null) {
                CustomQuickAlert().addImageAlert(context);
              } else {
                context.read<AuthRoleProfileBloc>().add(
                    UpdateClientProfileEvent(
                        image: imageBytes!, roleId: selectedItem!.id));
              }
            },
          ),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
      ],
    );
  }
}
