import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/header/header.dart';
import 'package:two_website/core/widgets/layouts/sidebar/sidebar.dart';

// ignore: must_be_immutable
class DesktopLayout extends StatelessWidget {
  DesktopLayout(
      {super.key,
      this.body,
      required this.currentPageIndex,
      required this.onItemSelected});
  final Widget? body;
  int currentPageIndex;
  dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: CustomSidebar(
            currentPageIndex: currentPageIndex,
            onItemSelected: onItemSelected,
          )),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  // HEADER
                  const CustomHeader(),
                  // BODY
                  body ?? const SizedBox()
                ],
              ))
        ],
      ),
    );
  }
}
