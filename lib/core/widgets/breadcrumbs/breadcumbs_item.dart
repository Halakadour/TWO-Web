import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Breadcrumbs extends StatelessWidget {
  final List<String> paths;

  const Breadcrumbs({super.key, required this.paths});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(paths.length, (index) {
        final isLast = index == paths.length - 1;
        return Row(
          children: [
            if (index > 0) const Text(' > '),
            GestureDetector(
              onTap: () {
                context.go('/${paths.sublist(0, index + 1).join('/')}');
              },
              child: Text(
                paths[index],
                style: TextStyle(
                  fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                  color: isLast ? Colors.black : Colors.blue,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
