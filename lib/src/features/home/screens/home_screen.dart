import 'package:beamer/beamer.dart';
import 'package:definev/src/features/home/screens/profile_section.dart';
import 'package:definev/src/public/widgets/button/border_button.dart';
import 'package:definev/src/public/widgets/button/underline_button.dart';
import 'package:definev/src/public/widgets/portfolio_header.dart';
import 'package:definev/src/utils/generator/resources.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  double avatarFieldWidth(BuildContext context) =>
      context.screenSize.width / 2 > 420 ? 420 : context.screenSize.width / 2;
  double avatarFieldHeight(BuildContext context) {
    return (context.screenSize.height - 420) > 600 ? avatarFieldWidth(context) + 111 : context.screenSize.height - 420;
  }

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
                    _buildPortfolioBody(sizeInfo, context),
                  ],
                ),
                _buildInfoField(context),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildInfoField(BuildContext context) {
    return Container(
      alignment: (context.screenSize.width < kDesktopTight) ? Alignment.topCenter : Alignment.topLeft,
      margin: (context.screenSize.width < kDesktopTight) ? EdgeInsets.zero : const EdgeInsets.only(left: 350),
      width: avatarFieldWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: avatarFieldHeight(context),
            width: avatarFieldWidth(context),
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TODO: Comment block of code performance better but slightly lag
                      // BEGIN
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colorScheme.background, width: 10),
                          image: const DecorationImage(
                            image: AssetImage(Images.avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset(Images.avatar, color: Colors.transparent, colorBlendMode: BlendMode.clear),
                      ),
                      // END
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: ProfileSection()),
        ],
      ),
    );
  }

  Widget _buildPortfolioBody(SizingInformation sizeInfo, BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: double.maxFinite,
              width: sizeInfo.screenSize.width - ((context.screenSize.width < kDesktopTight) ? 0 : 102),
              color: context.colorScheme.secondary,
              alignment: context.screenSize.width < kDesktopTight ? Alignment.center : Alignment.centerRight,
              child: Card(
                margin: context.screenSize.width < kDesktopTight ? EdgeInsets.zero : const EdgeInsets.only(right: 102),
                color: context.colorScheme.surface,
                child: SizedBox(
                  height: double.maxFinite,
                  width: context.screenSize.width < kDesktopTight
                      ? sizeInfo.screenSize.width
                      : context.screenSize.width - 102 - 50 - 300 - avatarFieldWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                  top: Sizes.m,
                                  bottom: Sizes.sm,
                                  left: Sizes.m,
                                ),
                                child: Text(
                                  'HOT',
                                  style: context.textTheme.headline1!.copyWith(fontSize: 75),
                                )),
                            const Expanded(
                              child: Center(
                                child: Text('Currently I\'m a bit busy ... So wait until I\'ve time ...'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                  top: Sizes.m,
                                  bottom: Sizes.sm,
                                  left: Sizes.m,
                                ),
                                child: Text(
                                  'NEW POST',
                                  style: context.textTheme.headline1!.copyWith(fontSize: 75),
                                )),
                            const Expanded(
                              child: Center(
                                child: Text('Currently I\'m a bit busy ... So wait until I\'ve time ...'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (context.screenSize.width >= kDesktopTight)
            Positioned(
              left: (context.screenSize.width < kDesktopTight) ? 0 : 25,
              right: (context.screenSize.width < kDesktopTight) ? 0 : null,
              bottom: 60,
              child: const NameWidget(),
            ),
        ],
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // TODO: Comment block of code performance better but slightly lag
      
          /// BEGIN
          RotatedBox(
            quarterTurns: 3,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  context.screenSize.width < kDesktopTight
                      ? context.colorScheme.onSecondary
                      : context.colorScheme.onBackground,
                  context.colorScheme.onSecondary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: List.generate(2, (index) => 0.241),
              ).createShader(bounds),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    Images.arrow1,
                    color: context.colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ),

          /// END

          SizedBox(
            width: context.screenSize.height < 1000 ? 419 : 558.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Insets.m, vertical: Insets.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UnderlineButton(
                        onPressed: () => launch(
                            'https://drive.google.com/file/d/17bgMKoFJmrS61ehzuHv4yqwAAm4go6_W/view?usp=sharing'),
                        title: 'download cv',
                        color: context.colorScheme.onSecondary,
                      ),
                      UnderlineButton(
                        // Change to BlogLocation
                        onPressed: () => context.beamToNamed('/blog'),
                        title: 'definev\'s blog',
                        color: context.colorScheme.onSecondary,
                      ),
                      UnderlineButton(
                        // Change to WorkLocation
                        onPressed: () => context.beamToNamed('/work'),
                        title: 'latest work',
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                ),

                // TODO: Comment block of code performance better but slightly lag
                // BEGIN
                Padding(
                  padding: EdgeInsets.only(bottom: context.screenSize.height < 1000.0 ? 19 : 0),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) => LinearGradient(
                      colors: [
                        context.colorScheme.onSecondary,
                        context.screenSize.width < kDesktopTight
                            ? context.colorScheme.onSecondary
                            : context.colorScheme.onBackground,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: List.generate(2, (index) => 0.4645),
                    ).createShader(bounds),
                    child: Text(
                      'DEFINEV_',
                      textAlign: (context.screenSize.width < kDesktopTight) ? TextAlign.center : TextAlign.start,
                      style: context.textTheme.headline1!.copyWith(
                        fontSize: context.screenSize.height < 1000 ? 90 : 120,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                    ),
                  ),
                ),
                // END
              ],
            ),
          ),
        ],
      ),
    );
  }
}
