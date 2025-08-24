  // final List<String> durations = [
  //   "${TextStrings.lessThan} 2 ",
  //   "3 - 5 ${TextStrings.month}",
  //   "6 - 10 ${TextStrings.month}",
  //   "${TextStrings.moreThan} 1 ${TextStrings.year}",
  // ];

  // final List<String> costs = [
  //   "${TextStrings.lessThan} \$1000",
  //   "\$1000 - \$5000",
  //   "\$6000 - \$9000",
  //   "${TextStrings.moreThan} \$10000"
  // ];
  // void _showAddCostDialog() async {
  //   String? customValue;

  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("أدخل كلفة مخصصة"),
  //         content: TextField(
  //           decoration: InputDecoration(
  //               hintText: "مثل : ${TextStrings.moreThan} \$50000 ",
  //               hintStyle:
  //                   AppTextStyle.bodySm(color: AppColors.fontLightColor)),
  //           onChanged: (value) => customValue = value,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("إلغاء"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (customValue != null && customValue!.trim().isNotEmpty) {
  //                 setState(() {
  //                   costs.add(customValue!);
  //                   widget.selectedCost.value = customValue!;
  //                 });
  //               }
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               "إضافة",
  //               style: AppTextStyle.buttonStyle(color: AppColors.white),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _showAddDurationDialog() async {
  //   String? customValue;

  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("أدخل مدة مخصصة"),
  //         content: TextField(
  //           decoration: InputDecoration(
  //               hintText: "مثل : 12 ${TextStrings.month}",
  //               hintStyle:
  //                   AppTextStyle.bodySm(color: AppColors.fontLightColor)),
  //           onChanged: (value) => customValue = value,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("إلغاء"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (customValue != null && customValue!.trim().isNotEmpty) {
  //                 setState(() {
  //                   durations.add(customValue!);
  //                   widget.selectedDuration.value = customValue!;
  //                 });
  //               }
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               "إضافة",
  //               style: AppTextStyle.buttonStyle(color: AppColors.white),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }





          // PaddingConfig.h24,
          // Text("${TextStrings.expectedDuration}*",
          //     style: AppTextStyle.bodySm()),
          // PaddingConfig.h16,
          // Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: [
          //     ...durations.map((label) {
          //       return ValueListenableBuilder<String?>(
          //         valueListenable: widget.selectedDuration,
          //         builder: (context, value, child) => CustomChoiceChip(
          //           label: label,
          //           selected: widget.selectedDuration.value == label,
          //           onSelected: () => widget.selectedDuration.value = label,
          //         ),
          //       );
          //     }),
          //     CustomChoiceChip(
          //       label: "+",
          //       selected: false,
          //       onSelected: _showAddDurationDialog,
          //     ),
          //   ],
          // ),
