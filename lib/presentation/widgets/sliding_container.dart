import 'package:flutter/material.dart';

import 'login_form_container.dart';

class SlidingContainer extends StatefulWidget {
  const SlidingContainer({super.key});

  @override
  State<SlidingContainer> createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  double _opacity = 0.0;

  void _updateOpacity() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _offset = Tween(begin: const Offset(0.0, 0.8), end: const Offset(0, 0.62))
        .animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateOpacity();
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: const LoginFormContainer(),
      ),
    );
  }
}