import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomMouseRegion extends StatefulWidget {
  CustomMouseRegion({super.key, required this.isHovered, required this.child});
  bool isHovered;
  final Widget? child;

  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegionState();
}

class _CustomMouseRegionState extends State<CustomMouseRegion> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (context) {
          setState(() {
            widget.isHovered = true;
          });
        },
        onExit: (context) {
          setState(() {
            widget.isHovered = false;
          });
        },
        child: widget.child);
  }
}
