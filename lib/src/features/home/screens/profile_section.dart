import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:definev/src/public/widgets/animation/animated_text.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_hooks/blog_hooks.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.background,
      child: ListView(
        padding: const EdgeInsets.all(Insets.xl),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'BUI DAI DUONG',
                style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
              ),
              Insets.sm.vertical,
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: DefaultTextStyle(
                  style: context.textTheme.headline6!.copyWith(
                    decoration: TextDecoration.underline,
                    color: context.colorScheme.secondary,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('@mobile_developer'),
                      TyperAnimatedText('@web_developer'),
                      TyperAnimatedText('@pet_lover'),
                      TyperAnimatedText('@flutter_enthusiant'),
                      TyperAnimatedText('@definev_'),
                    ],
                    isRepeatingAnimation: false,
                    repeatForever: true,
                    onTap: () {
                      launch('mailto:daiduong.workmail@gmail.com');
                    },
                  ),
                ),
              ),
            ],
          ),
          Insets.l.vertical,
          const SelectableText(
            r'''Hello,

I'm Duong Bui, from Vietnam. You can call me Noah. I'm a self-taught developer, i'm self-learned Flutter, React and Golang.

I've more than 2 years experiences in mobile app development with Flutter. Currentlly, i trying to learn Go for backend and React for web.

Currently, I'm 1st-year student in Phenikaa University.

I love music, I'm playing ukulele when freetime.

I'm an introverse.

@2021 Copyright by Definev_''',
            selectionHeightStyle: BoxHeightStyle.max,
            textAlign: TextAlign.justify,
          ),
          Insets.xl.vertical,
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              runSpacing: Insets.m,
              spacing: Insets.m,
              children: [
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'My little cat'),
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'Flutter'),
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'React'),
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'Golang'),
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'Daily Thought'),
                Hashtag(uri: Uri.parse('https://definev.github.io/blog'), label: 'Blogs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hashtag extends HookWidget {
  const Hashtag({
    Key? key,
    required this.uri,
    required this.label,
  }) : super(key: key);

  final Uri uri;
  final String label;

  @override
  Widget build(BuildContext context) {
    final _hover = useState(false);
    return MouseRegion(
      onEnter: (_) => _hover.value = true,
      onExit: (_) => _hover.value = false,
      child: Chip(
        label: GestureDetector(
          onTap: () => launch(uri.path),
          child: Text(
            '# $label',
            style: context.textTheme.caption!.copyWith(
              color: _hover.value ? context.colorScheme.onSecondary : context.colorScheme.onSurface,
            ),
          ),
        ),
        backgroundColor: _hover.value ? context.colorScheme.secondary : context.colorScheme.surface,
      ),
    );
  }
}
