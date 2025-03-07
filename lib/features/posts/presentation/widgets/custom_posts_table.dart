import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class CustomPostsTable extends StatelessWidget {
  const CustomPostsTable({super.key, required this.activePostsList});
  final List<PostEntity> activePostsList;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      minWidth: 500,
      dividerThickness: 0,
      horizontalMargin: 20,
      headingRowHeight: 56,
      headingTextStyle: AppTextStyle.subtitle01(),
      headingRowColor: WidgetStateColor.resolveWith(
        (states) => AppColors.grayColor,
      ),
      headingRowDecoration:
          BoxDecoration(border: Border.all(color: AppColors.fontLightColor)),
      columns: const [
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.document,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Title")
          ],
        )),
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.image,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Poster")
          ],
        )),
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.status,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Status")
          ],
        )),
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.message,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Replies")
          ],
        )),
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.repeat_circle,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Actions")
          ],
        )),
      ],
      fixedColumnsColor: AppColors.darkGreenColor,
      rows: List<DataRow>.generate(
          activePostsList.length,
          (index) => DataRow(cells: [
                DataCell(Text(activePostsList[index].body)),
                DataCell(CustomRoundedImage(
                  imageType: ImageType.network,
                  image: "$imageUri${activePostsList[index].image}",
                  borderRadius: 2,
                )),
                const DataCell(ActiveStatusContainer()),
                DataCell(GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRouteConfig.postReplies,
                          pathParameters: {
                            'id': activePostsList[index].id.toString(),
                          });
                    },
                    child: Container(
                        width: 75,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.grayColor, width: 1.1),
                            color: const Color(0xFFACCFFF),
                            borderRadius: BorderRadius.circular(
                                SizesConfig.borderRadiusSm)),
                        child: Text(
                          "Brawse",
                          style: AppTextStyle.subtitle02(
                              color: AppColors.blueColor),
                        )))),
                DataCell(Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.read<PostBloc>().add(UnActivePostEvent(
                              postId: activePostsList[index].id));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.grayColor, width: 1.1),
                              borderRadius: BorderRadius.circular(
                                  SizesConfig.borderRadiusSm)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 10,
                                  child: Icon(
                                    Iconsax.eye_slash,
                                    size: SizesConfig.iconsSm,
                                  )),
                              PaddingConfig.w8,
                              Text("Un Active")
                            ],
                          ),
                        )),
                    PaddingConfig.w8,
                    GestureDetector(
                        onTap: () {
                          context.read<PostBloc>().add(DeletePostEvent(
                              postId: activePostsList[index].id));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.grayColor, width: 1.1),
                              borderRadius: BorderRadius.circular(
                                  SizesConfig.borderRadiusSm)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 10,
                                  child: Icon(
                                    Iconsax.trash,
                                    size: SizesConfig.iconsSm,
                                  )),
                              PaddingConfig.w8,
                              Text("Delete")
                            ],
                          ),
                        )),
                  ],
                )),
              ])),
    );
  }
}

class ActiveStatusContainer extends StatelessWidget {
  const ActiveStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1.1),
          color: const Color(0xFFCBFFBA),
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
            child: CircleAvatar(
              backgroundColor: AppColors.greenColor,
            ),
          ),
          PaddingConfig.w8,
          Text("Active")
        ],
      ),
    );
  }
}
