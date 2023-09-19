class UrlGenerator {
  const UrlGenerator(this.userId);

  final String userId;

  Uri toTwitterHttpsScheme() {
    return Uri.parse('https://twitter.com/$userId');
  }

  Uri toInstagramHttpsScheme() {
    return Uri.parse('https://www.instagram.com/$userId/');
  }
}
