import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/buttons/edit_button.dart';
import 'package:two_website/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_website/core/widgets/images/memory_image_fetch.dart';
import 'package:two_website/core/widgets/buttons/delete_button.dart';
import 'package:two_website/features/services/domain/entities/service_entity.dart';
import 'package:two_website/features/services/presentation/bloc/service_bloc.dart';

class CustomServiceTable extends StatelessWidget {
  const CustomServiceTable({super.key, required this.serviceList});
  final List<ServiceEntity> serviceList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
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
          children: [
            Icon(
              Iconsax.archive_1,
              size: SizesConfig.iconsMd,
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
              Iconsax.gallery,
              size: SizesConfig.iconsMd,
            ),
            PaddingConfig.w8,
            Text("Image")
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
          serviceList.length,
          (index) => DataRow(
                  color: WidgetStateColor.resolveWith((states) =>
                      index.isEven ? AppColors.white : AppColors.fieldColor),
                  cells: [
                    DataCell(
                      Text("${serviceList[index].idE}"),
                    ),
                    DataCell(
                      Text(serviceList[index].titleE),
                    ),
                    DataCell(
                      Text(serviceList[index].descriptionE),
                    ),
                    DataCell(Center(
                        child: MemoryImageFetch(
                            poster: serviceList[index].imageE))),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EditButton(
                          onTap: () {},
                        ),
                        PaddingConfig.w8,
                        DeleteButton(
                          onTap: () {
                            context.read<ServiceBloc>().add(DeleteServiceEvent(
                                serviceId: serviceList[index].idE.toString()));
                            context
                                .read<ServiceBloc>()
                                .add(ShowServicesEvent());
                          },
                        ),
                      ],
                    )),
                  ])),
    );
  }
}
