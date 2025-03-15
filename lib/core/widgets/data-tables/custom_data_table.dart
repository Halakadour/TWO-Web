import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({super.key, required this.columns, required this.rows});
  final List<DataColumn> columns;
  final List<DataRow> rows;

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
        columns: columns,
        fixedColumnsColor: AppColors.greenShade3,
        rows: rows);
  }
}
