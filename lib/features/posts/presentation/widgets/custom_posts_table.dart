import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/memory_image_fetch.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/core/widgets/layouts/buttons/active_status_container.dart';
import 'package:two_website/core/widgets/layouts/buttons/browse_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/deactive_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/delete_button.dart';

class CustomPostsTable extends StatelessWidget {
  const CustomPostsTable({super.key, required this.activePostsList});
  final List<PostEntity> activePostsList;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      border: TableBorder.all(
          color: AppColors.rockShade2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(SizesConfig.borderRadiusSm),
              topRight: Radius.circular(SizesConfig.borderRadiusSm)),
          width: .4),
      showCheckboxColumn: true,
      showHeadingCheckBox: true,
      showBottomBorder: false,
      columnSpacing: 12,
      dataRowHeight: 60,
      minWidth: 500,
      dividerThickness: .2,
      horizontalMargin: 20,
      headingRowHeight: 56,
      headingTextStyle: AppTextStyle.subtitle01(),
      headingRowColor: WidgetStateColor.resolveWith(
        (states) => AppColors.blueShade1,
      ),
      headingRowDecoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizesConfig.borderRadiusSm),
              topRight: Radius.circular(SizesConfig.borderRadiusSm))),
      dataRowColor: WidgetStateColor.resolveWith(
        (states) => AppColors.fieldColor,
      ),
      columns: const [
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.archive_1,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Title")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.gallery,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Poster")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.status,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Status")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.message_notif,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Replies")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.chart_3,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Actions")
          ],
        )),
      ],
      fixedColumnsColor: AppColors.greenShade3,
      rows: List<DataRow>.generate(
          activePostsList.length,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: [
                    DataCell(
                      Text(activePostsList[index].body),
                    ),
                    DataCell(Center(
                        child: MemoryImageFetch(
                            poster: activePostsList[index].poster))),
                    const DataCell(Center(child: ActiveStatusContainer())),
                    DataCell(Center(
                      child: BrowseButton(
                        onTap: () {
                          context.pushNamed(AppRouteConfig.postReplies,
                              pathParameters: {
                                'id': activePostsList[index].postId.toString(),
                              });
                        },
                      ),
                    )),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeactivateButton(
                          onTap: () {
                            context.read<PostBloc>().add(UnActivePostEvent(
                                postId: activePostsList[index].postId));
                            context.read<PostBloc>().add(GetActivePostsEvent());
                          },
                        ),
                        PaddingConfig.w8,
                        DeleteButton(
                          onTap: () {
                            context.read<PostBloc>().add(DeletePostEvent(
                                postId: activePostsList[index].postId));
                            context.read<PostBloc>().add(GetActivePostsEvent());
                          },
                        ),
                      ],
                    )),
                  ])),
    );
  }
}
