class UrlGenerator {
  const UrlGenerator(this.userId);

  final String userId;

  Uri toTwitterScheme() {
    return Uri.parse('twitter://user?id=$userId');
  }

  Uri toTwitterHttpsScheme() {
    return Uri.parse('https://twitter.com/$userId');
  }

  Uri toInstagramScheme() {
    return Uri.parse('instagram://user?username=$userId');
  }

  Uri toInstagramHttpsScheme() {
    return Uri.parse('https://www.instagram.com/$userId/');
  }
}
