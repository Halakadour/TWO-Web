import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/dialog/global/global_dialogs.dart';
import 'package:two_website/core/widgets/dialog/why-us-about-us/why_us_about_us_dialogs.dart';
import 'package:two_website/core/widgets/buttons/edit_button.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/core/widgets/buttons/delete_button.dart';

class CustomWhyUsTable extends StatelessWidget {
  const CustomWhyUsTable({super.key, required this.whyUsList});
  final List<WhyUsEntity?> whyUsList;

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
            headingRowAlignment: MainAxisAlignment.center,
            label: Row(
              children: [
                Icon(
                  Iconsax.hashtag,
                  size: SizesConfig.iconsMd,
                ),
                PaddingConfig.w8,
                Text("ID")
              ],
            )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
          whyUsList.length,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: [
                    DataCell(
                      Text("#${whyUsList[index]!.whyUsId}"),
                    ),
                    DataCell(
                      Center(
                        child: Text(whyUsList[index] == null
                            ? "No Data"
                            : whyUsList[index]!.whyUsDoc),
                      ),
                    ),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EditButton(
                          onTap: () {
                            AboutUsWhyUsDialogs().updateWhyUsDialog(
                                context,
                                TextEditingController(
                                    text: whyUsList[index]!.whyUsDoc),
                                whyUsList[index]!.whyUsId);
                          },
                        ),
                        PaddingConfig.w8,
                        DeleteButton(
                          onTap: () {
                            GlobalDialogs().confirmDeletionDialog(
                              context,
                              whyUsList[index]!.whyUsDoc,
                              () {
                                context.read<AboutUsWhyUsBloc>().add(
                                    DeleteWhyUsEvent(
                                        whyUsId: whyUsList[index]!.whyUsId));
                                context.pop();
                              },
                            );
                          },
                        ),
                      ],
                    )),
                  ])),
    );
  }
}
