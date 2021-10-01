import 'package:beamer/beamer.dart';
import 'package:definev/src/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('home-definev'),
        name: 'Welcome to Definev',
        title: 'Definev\'s Home',
        type: BeamPageType.fadeTransition,
        child: const HomeScreen(),
      ),
    ];
  }

  @override
  List get pathBlueprints => ['/'];
}
