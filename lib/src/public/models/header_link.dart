class HeaderLink {
  final String title;
  final String path;

  HeaderLink({required this.title, required this.path});
}

final headerLinkList = <HeaderLink>[
  HeaderLink(title: 'latest work', path: '/work'),
  HeaderLink(title: 'blog', path: '/blog'),
  HeaderLink(title: 'about me', path: '/about-me'),
];