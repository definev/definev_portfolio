import 'package:beamer/beamer.dart';
import 'package:definev/src/features/home/routers/home_location.dart';
import 'package:definev/src/public/widgets/portfolio_header.dart';
import 'package:definev/src/utils/generator/resources.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppRouters {
  static final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]),
    notFoundPage: BeamPage(
      child: const NotFoundPage(),
      type: BeamPageType.fadeTransition,
    ),
  );
  static final routeInformationParser = BeamerParser();
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: PortfolioHeader(),
          ),
          Expanded(
            child: Material(
              color: context.colorScheme.secondary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SizedBox(
                      height: 300.0,
                      width: 300.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colorScheme.primary, width: 10),
                          image: const DecorationImage(image: AssetImage(Images.cat)),
                        ),
                      ),
                    ),
                  ),
                  Insets.xl.vertical,
                  Center(
                    child: ResponsiveBuilder(
                      builder: (context, sizeInfo) {
                        if (sizeInfo.deviceScreenType == DeviceScreenType.desktop) {
                          return Text(
                            '404 Not Found',
                            style: context.textTheme.headline2!.copyWith(
                              color: context.colorScheme.onSecondary,
                            ),
                          );
                        }
                        if (sizeInfo.deviceScreenType == DeviceScreenType.tablet) {
                          return Text(
                            '404 Not Found',
                            style: context.textTheme.headline3!.copyWith(
                              color: context.colorScheme.onSecondary,
                            ),
                          );
                        }
                        if (sizeInfo.deviceScreenType == DeviceScreenType.mobile) {
                          return Text(
                            '404 Not Found',
                            style: context.textTheme.headline5!.copyWith(
                              color: context.colorScheme.onSecondary,
                            ),
                          );
                        }
                        return Text(
                          '404 Not Found',
                          style: context.textTheme.headline6!.copyWith(
                            color: context.colorScheme.onSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
