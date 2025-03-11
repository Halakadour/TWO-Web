import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/posts/presentation/widgets/loading_posts_table.dart';

class LoadingWhyUsTable extends StatelessWidget {
  const LoadingWhyUsTable({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
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
          4,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: const [
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                  ])),
    );
  }
}
