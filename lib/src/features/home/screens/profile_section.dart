import 'dart:ui';

import 'package:definev/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/link.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'BUI DAI DUONG',
                    style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' / MOBILE DEVELOPER',
                        style: context.textTheme.bodyText1!.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Insets.l.vertical,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SelectableText(
                    r'''Hello,

I'm Duong Bui, from Vietnam. You can call me Noah. I'm a self-taught developer, i'm self-learned Flutter, React and Golang.

I've more than 2 years experiences in mobile app development with Flutter. Currentlly, i trying to learn Go for backend and React for web.

I love music so I play ukulele when freetime.

I'm an introverse.''',
                    selectionHeightStyle: BoxHeightStyle.max,
                    textAlign: TextAlign.justify,
                  ),
                  Wrap(
                    runSpacing: Insets.m,
                    spacing: Insets.m,
                    children: [
                      Hashtag(uri: Uri.parse('/flutter'), label: 'My little cat'),
                      Hashtag(uri: Uri.parse('/flutter'), label: 'Flutter'),
                      Hashtag(uri: Uri.parse('/flutter'), label: 'React'),
                      Hashtag(uri: Uri.parse('/flutter'), label: 'Golang'),
                      Hashtag(uri: Uri.parse('/flutter'), label: 'Daily Thought'),
                      Hashtag(uri: Uri.parse('/flutter'), label: 'Blogs'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hashtag extends StatelessWidget {
  const Hashtag({
    Key? key,
    required this.uri,
    required this.label,
  }) : super(key: key);

  final Uri uri;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: uri,
      builder: (BuildContext context, FollowLink? followLink) {
        return HookBuilder(
          builder: (context) {
            final _hover = useState(false);
            return MouseRegion(
              onEnter: (_) => _hover.value = true,
              onExit: (_) => _hover.value = false,
              child: Chip(
                label: GestureDetector(
                  onTap: followLink,
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
          },
        );
      },
    );
  }
}
