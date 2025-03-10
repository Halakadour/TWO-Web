import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/buttons/edit_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/core/widgets/layouts/buttons/delete_button.dart';

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
                        BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                          listener: (context, state) {
                            updateWhyUsStateHandling(state, context);
                          },
                          listenWhen: (previous, current) =>
                              previous.updateWhyUsStatus !=
                              current.updateAboutUsStatus,
                          child: EditButton(
                            onTap: () {
                              context.read<AboutUsWhyUsBloc>().add(
                                  UpdateWhyUsEvent(
                                      whyUsId:
                                          whyUsList[index]!.whyUsId.toString(),
                                      whyUs: whyUsList[index]!.whyUsDoc));
                            },
                          ),
                        ),
                        PaddingConfig.w8,
                        BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                          listener: (context, state) {
                            deleteWhyUsStateHandling(state, context);
                          },
                          listenWhen: (previous, current) =>
                              previous.deleteWhyUsStatus !=
                              current.deleteWhyUsStatus,
                          child: DeleteButton(
                            onTap: () {
                              context.read<AboutUsWhyUsBloc>().add(
                                  DeleteWhyUsEvent(
                                      whyUsId: whyUsList[index]!
                                          .whyUsId
                                          .toString()));
                            },
                          ),
                        ),
                      ],
                    )),
                  ])),
    );
  }

  void updateWhyUsStateHandling(AboutUsWhyUsState state, BuildContext context) {
    if (state.updateWhyUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.updateWhyUsStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.updateWhyUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.updateWhyUsStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  void deleteWhyUsStateHandling(AboutUsWhyUsState state, BuildContext context) {
    if (state.deleteWhyUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deleteWhyUsStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.deleteWhyUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deleteWhyUsStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
