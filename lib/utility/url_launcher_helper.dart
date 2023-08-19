import 'package:url_launcher/url_launcher.dart';
import 'package:yagamy/utility/url_generator.dart';

Future launchUrlCustom(Uri url, {Uri? anotherUrl}) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else if (anotherUrl != null && await canLaunchUrl(anotherUrl)) {
    await launchUrl(anotherUrl);
  }
}

Future launchUrlTwitter(String twitterId) async {
  await launchUrlCustom(UrlGenerator(twitterId).toTwitterScheme(),
      anotherUrl: UrlGenerator(twitterId).toTwitterHttpsScheme());
}

Future launchUrlInstagram(String instagramId) async {
  await launchUrlCustom(UrlGenerator(instagramId).toInstagramScheme(),
      anotherUrl: UrlGenerator(instagramId).toInstagramHttpsScheme());
}
