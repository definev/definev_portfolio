import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:definev/src/utils/styles.dart';

class BorderButton extends HookWidget {
  const BorderButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final hoverState = useState(false);

    return MouseRegion(
      onEnter: (event) => hoverState.value = true,
      onExit: (event) => hoverState.value = false,
      child: SizedBox(
        child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(Sizes.m)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
            side: MaterialStateProperty.all(
                hoverState.value ? BorderSide(color: context.colorScheme.secondary, width: 1.5) : null),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: Insets.l)),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
