import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_website/core/widgets/shimmers/shimmer_table_item.dart';

class LoadingContactUsTable extends StatelessWidget {
  const LoadingContactUsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
            label: Row(
          children: [
            Icon(
              Iconsax.gallery,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Profile")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.frame_1,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Name")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.message,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Email")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.call,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Phone")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.document,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Subject")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.edit,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Description")
          ],
        )),
        DataColumn2(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.activity,
              size: SizesConfig.iconsSm,
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
              Iconsax.chart_3,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text("Actions")
          ],
        )),
      ],
      rows: List<DataRow>.generate(
          8,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: const [
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                    DataCell(Center(child: ShimmerTableItem())),
                  ])),
    );
  }
}
