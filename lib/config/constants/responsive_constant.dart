import 'package:responsive_framework/responsive_framework.dart';

List<Breakpoint> breakpoints = [
  const Breakpoint(start: 0, end: 450, name: MOBILE),
  const Breakpoint(start: 451, end: 800, name: TABLET),
  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
];

List<Breakpoint> breakpointsLandscape = [
  const Breakpoint(start: 0, end: 1023, name: MOBILE),
  const Breakpoint(start: 1024, end: 1599, name: TABLET),
  const Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),
];
