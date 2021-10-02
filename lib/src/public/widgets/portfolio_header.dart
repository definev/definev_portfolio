import 'package:definev/src/public/models/header_link.dart';
import 'package:definev/src/public/widgets/button/border_button.dart';
import 'package:definev/src/public/widgets/portfolio_header_menu.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.xl, left: 57, right: 57, bottom: Insets.xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.beamToNamed('/'),
            child: ResponsiveBuilder(
              builder: (context, sizeInfo) {
                if (sizeInfo.screenSize.width < kDesktopTight) {
                  return SizedBox(
                    height: 63,
                    width: 63,
                    child: BorderButton(
                      child: const Text('D_'),
                      onPressed: () => context.beamToNamed('/'),
                      alwayBorder: true,
                    ),
                  );
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DEFINEV_',
                      style: context.textTheme.headline5!.copyWith(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text('A developer guy'),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 63,
            child: ResponsiveBuilder(
              builder: (context, sizeInfo) {
                if (sizeInfo.screenSize.width < kDesktopTight) {
                  return IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      useSafeArea: true,
                      builder: (context) => const PortfolioHeaderMenu(),
                    ),
                    icon: const Icon(Icons.menu),
                  );
                }

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (final link in headerLinkList)
                      Padding(
                        padding: const EdgeInsets.only(left: Insets.m),
                        child: HeaderLinkWidget(link: link),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderLinkWidget extends StatelessWidget {
  const HeaderLinkWidget({
    Key? key,
    required this.link,
  }) : super(key: key);

  final HeaderLink link;

  @override
  Widget build(BuildContext context) {
    return BorderButton(
      child: Text(link.title),
      onPressed: () => context.beamToNamed(link.path),
    );
  }
}
