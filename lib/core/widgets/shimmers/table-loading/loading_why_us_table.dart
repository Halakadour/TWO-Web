import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_website/core/widgets/shimmers/shimmer_table_item.dart';

class LoadingWhyUsTable extends StatelessWidget {
  const LoadingWhyUsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
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
