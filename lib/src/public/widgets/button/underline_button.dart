import 'package:definev/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UnderlineButton extends HookWidget {
  const UnderlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final onRegion = useState(false);

    return MouseRegion(
      onEnter: (_) => onRegion.value = true,
      onExit: (_) => onRegion.value = false,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          height: Sizes.l,
          width: 100.0,
          child: Column(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                title,
                style: context.textTheme.bodyText1!.copyWith(color: color),
              ))),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: onRegion.value == true ? 1 : 0),
                duration: Durations.fast,
                curve: Curves.decelerate,
                builder: (context, value, child) => Container(
                  height: 2 + 2 * value,
                  width: double.maxFinite,
                  color: color ?? context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
