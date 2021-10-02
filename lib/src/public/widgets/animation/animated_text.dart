import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key, required this.texts, required this.duration}) : super(key: key);

  final List<String> texts;
  final Duration duration;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  TimelineTween<Prop> _createComplexTween() {
    var tween = TimelineTween<Prop>();

    var fadeIn = tween
        .addScene(
          begin: const Duration(seconds: 0),
          duration: const Duration(milliseconds: 300),
        )
        .animate(Prop.x, tween: Tween<double>(begin: 0.0, end: 100.0))
        .animate(Prop.y, tween: Tween<double>(begin: 0.0, end: 100.0));

    var grow = fadeIn
        .addSubsequentScene(duration: const Duration(milliseconds: 700))
        .animate(Prop.x, tween: Tween<double>(begin: 100.0, end: 200.0))
        .animate(Prop.y, tween: Tween<double>(begin: 100.0, end: 200.0));

    var fadeOut = grow
        .addSubsequentScene(duration: const Duration(milliseconds: 300))
        .animate(Prop.x, tween: Tween<double>(begin: 200.0, end: 0.0))
        .animate(Prop.y, tween: Tween<double>(begin: 200.0, end: 0.0));

    return tween;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
