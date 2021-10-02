import 'package:definev/src/public/models/header_link.dart';
import 'package:definev/src/public/widgets/portfolio_header.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:flutter/material.dart';

class PortfolioHeaderMenu extends StatefulWidget {
  const PortfolioHeaderMenu({Key? key}) : super(key: key);

  @override
  State<PortfolioHeaderMenu> createState() => _PortfolioHeaderMenuState();
}

class _PortfolioHeaderMenuState extends State<PortfolioHeaderMenu> {
  @override
  Widget build(BuildContext context) {
    if (context.screenSize.width >= kDesktopTight) return const SizedBox();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 111,
            child: Padding(
              padding: const EdgeInsets.only(top: Insets.xl, left: 57, right: 57, bottom: Insets.xl),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (final link in headerLinkList)
                  Padding(
                    padding: const EdgeInsets.only(top: Insets.l),
                    child: HeaderLinkWidget(link: link),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
