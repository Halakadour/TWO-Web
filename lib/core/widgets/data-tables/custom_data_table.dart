import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/animation/empty_status_animation.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({super.key, required this.columns, required this.rows});
  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        clipBehavior: Clip.hardEdge,
        empty: const EmptyStatusAnimation(),
        isVerticalScrollBarVisible: true,
        isHorizontalScrollBarVisible: true,
        border: TableBorder.all(
            color: AppColors.rockShade2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SizesConfig.borderRadiusSm),
                topRight: Radius.circular(SizesConfig.borderRadiusSm)),
            width: .4),
        horizontalMargin: 10,
        columnSpacing: 10,
        dataRowHeight: 50,
        minWidth: 500,
        dividerThickness: .2,
        headingRowHeight: 50,
        headingTextStyle: AppTextStyle.subtitle02(),
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
        columns: columns,
        fixedColumnsColor: AppColors.greenShade3,
        rows: rows);
  }
}
