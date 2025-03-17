import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/buttons/approved_button.dart';
import 'package:two_website/core/widgets/buttons/seen_button.dart';
import 'package:two_website/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_website/core/widgets/images/memory_image_fetch.dart';
import 'package:two_website/core/widgets/status-boxes/approved_status_container.dart';
import 'package:two_website/core/widgets/status-boxes/rejected_status_container.dart';
import 'package:two_website/core/widgets/status-boxes/seen_status_container.dart';
import 'package:two_website/core/widgets/status-boxes/un_seen_status_container.dart';
import 'package:two_website/features/contact-us/data/models/contact_us_model.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';

class CustomContactUsTable extends StatelessWidget {
  const CustomContactUsTable({super.key, required this.contactUsList});
  final List<ContactUsModel> contactUsList;

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
          contactUsList.length,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: [
                    DataCell(Center(
                        child: MemoryImageFetch(
                            poster: contactUsList[index].client.image))),
                    DataCell(
                      Center(child: Text(contactUsList[index].client.name)),
                    ),
                    DataCell(
                      Center(child: Text(contactUsList[index].client.email)),
                    ),
                    DataCell(
                      Center(child: Text(contactUsList[index].phone)),
                    ),
                    DataCell(
                      Center(child: Text(contactUsList[index].subject)),
                    ),
                    DataCell(
                      Center(child: Text(contactUsList[index].description)),
                    ),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (contactUsList[index].seen == 1)
                            ? const SeenStatusContainer()
                            : const UnSeenStatusContainer(),
                        PaddingConfig.w8,
                        (contactUsList[index].techApproved == 1)
                            ? const ApprovedStatusContainer()
                            : const RejectedStatusContainer()
                      ],
                    )),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SeenButton(
                          onTap: () {
                            context.read<ContactUsBloc>().add(
                                MarkContactUsAsSeenEvent(
                                    contactUsId: contactUsList[index].id));
                            context
                                .read<ContactUsBloc>()
                                .add(GetContactUsWithSeenAndApprovedEvent());
                          },
                        ),
                        PaddingConfig.w8,
                        ApprovedButton(
                          onTap: () {
                            context.read<ContactUsBloc>().add(
                                MarkContactUsAsApprovedEvent(
                                    contactUsId: contactUsList[index].id));
                            context
                                .read<ContactUsBloc>()
                                .add(GetContactUsWithSeenAndApprovedEvent());
                          },
                        ),
                      ],
                    )),
                  ])),
    );
  }
}
