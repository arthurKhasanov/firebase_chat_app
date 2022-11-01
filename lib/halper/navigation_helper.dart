import 'package:flutter/material.dart';

class NavigationHelper {
  static void nextScreen({
    required BuildContext context,
    required Widget page,
    required PageRouteDirection direction,
  }) {
    Navigator.push(context, CustomPageRoute(direction: direction, page: page));
  }

  static void nextScreenReplacement({
    required BuildContext context,
    required Widget page,
    required PageRouteDirection direction,
  }) {
    Navigator.pushReplacement(
        context, CustomPageRoute(direction: direction, page: page));
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final PageRouteDirection direction;

  List<Offset> _getDirection() {
    switch (direction) {
      case PageRouteDirection.leftToRight:
        return [const Offset(-1, 0), Offset.zero];
      case PageRouteDirection.rightToLeft:
        return [const Offset(2, 0), Offset.zero];
      case PageRouteDirection.bottomToTop:
        return [const Offset(0, 2), Offset.zero];
    }
  }

  CustomPageRoute({
    required this.direction,
    required this.page,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: _getDirection()[0],
          end: _getDirection()[1],
        ).animate(animation),
        child: child);
  }
}

enum PageRouteDirection { leftToRight, rightToLeft, bottomToTop }
