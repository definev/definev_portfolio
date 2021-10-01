import 'package:definev/src/public/widgets/button/border_button.dart';
import 'package:definev/src/public/widgets/portfolio_header.dart';
import 'package:definev/src/utils/generator/resources.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizeInfo) {
          if (sizeInfo.isDesktop) {
            return Stack(
              children: [
                Column(
                  children: [
                    const PortfolioHeader(),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: double.maxFinite,
                              width: sizeInfo.screenSize.width - 140,
                              color: context.colorScheme.secondary,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 180,
                              width: sizeInfo.screenSize.width - (sizeInfo.screenSize.width - 515) / 2,
                              color: context.colorScheme.background,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  UnderlineButton(
                                    onPressed: () {},
                                    title: 'download cv',
                                  ),
                                  UnderlineButton(
                                    onPressed: () {},
                                    title: 'latest work',
                                  ),
                                  UnderlineButton(
                                    onPressed: () {},
                                    title: 'case studies',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 52,
                            bottom: 235,
                            child: NameWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 600,
                    width: 515,
                    color: context.colorScheme.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 111,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BorderButton(
                                child: Text('fb',
                                    style: context.textTheme.bodyText1!.copyWith(color: context.colorScheme.onPrimary)),
                                onPressed: () => launch('https://www.facebook.com/definev/'),
                              ),
                              Insets.xl.horizontal,
                              BorderButton(
                                child: Text('in',
                                    style: context.textTheme.bodyText1!.copyWith(color: context.colorScheme.onPrimary)),
                                onPressed: () => launch('https://www.linkedin.com/in/bui-duong-b574291a9/'),
                              ),
                              Insets.xl.horizontal,
                              BorderButton(
                                child: Text('gh',
                                    style: context.textTheme.bodyText1!.copyWith(color: context.colorScheme.onPrimary)),
                                onPressed: () => launch('https://github.com/definev'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 76.0),
                          child: SizedBox(
                            height: 515 - 76 * 2,
                            width: 515 - 76 * 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: context.colorScheme.background, width: 10),
                                image: const DecorationImage(
                                  image: AssetImage(Images.avatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Image.asset(Images.avatar,
                                  color: Colors.transparent, colorBlendMode: BlendMode.clear),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class UnderlineButton extends HookWidget {
  const UnderlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

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
              Expanded(child: Center(child: Text(title))),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: onRegion.value == true ? 1 : 0),
                duration: Durations.fast,
                curve: Curves.decelerate,
                builder: (context, value, child) => Container(
                  height: 2 + 2 * value,
                  width: double.maxFinite,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NameWidget extends HookWidget {
  const NameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'DEFINEV_',
      style: context.textTheme.headline1!.copyWith(
        fontWeight: FontWeight.bold,
        wordSpacing: 1,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = context.colorScheme.onBackground,
      ),
    );
  }
}
