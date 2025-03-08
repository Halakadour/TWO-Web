import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/buttons/add_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/delete_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/edit_button.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/site_card.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/working_time_card.dart';

class AboutUsWhyUsPage extends StatefulWidget {
  const AboutUsWhyUsPage({super.key});

  @override
  State<AboutUsWhyUsPage> createState() => _AboutUsWhyUsPageState();
}

class _AboutUsWhyUsPageState extends State<AboutUsWhyUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Us :",
              style: AppTextStyle.heading03(),
            ),
            PaddingConfig.h16,
            const Row(
              children: [WorkingTimeCard(), PaddingConfig.w24, SiteCard()],
            ),
            PaddingConfig.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Why Us :",
                  style: AppTextStyle.heading03(),
                ),
                AddButton(
                  addingType: "Why Us",
                  onPressed: () {},
                )
              ],
            ),
            PaddingConfig.h16,
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizesConfig.borderRadiusLg)),
                child: DataTable2(
                  columnSpacing: 12,
                  minWidth: 400,
                  dividerThickness: 0,
                  horizontalMargin: 20,
                  headingRowHeight: 56,
                  headingTextStyle: AppTextStyle.subtitle01(),
                  headingRowColor: WidgetStateColor.resolveWith(
                    (states) => AppColors.gray,
                  ),
                  headingRowDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizesConfig.borderRadiusMd))),
                  columns: const [
                    DataColumn2(label: Text("ID")),
                    DataColumn2(label: Text("Title")),
                    DataColumn2(label: Text("Actions")),
                  ],
                  rows: List<DataRow>.generate(
                      2,
                      (index) => DataRow(cells: [
                            const DataCell(Text("#0")),
                            const DataCell(Text("Documented Success")),
                            DataCell(Row(
                              children: [
                                EditButton(
                                  onTap: () {},
                                ),
                                PaddingConfig.w8,
                                DeleteButton(
                                  onTap: () {},
                                )
                              ],
                            )),
                          ])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
