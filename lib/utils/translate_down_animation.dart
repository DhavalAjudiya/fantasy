import 'package:flutter/material.dart';

class TranslateDownAnimation extends StatelessWidget {
  const TranslateDownAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 2, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, height * value * -5),
          child: child,
        );
      },
    );
  }
}
