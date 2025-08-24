// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/pages/order-project/responsive-pages/order_project_desktop_tablet.dart';
import 'package:two_website/features/auth/presentation/pages/order-project/responsive-pages/order_project_mobile.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

class OrderProjectPage extends StatelessWidget {
  const OrderProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingBloc, LandingState>(
      listener: (context, state) {
        AuthStateHandling().orderProjectListener(state, context);
      },
      listenWhen: (previous, current) {
        return (previous.createProjectStatus != current.createProjectStatus);
      },
      child: const CustomSiteTemplate(
        desktop: OrderProjectDesktopTablet(),
        tablet: OrderProjectDesktopTablet(),
        mobile: OrderProjectMobile(),
      ),
    );
  }
}
