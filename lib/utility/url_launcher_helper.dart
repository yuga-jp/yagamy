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
  await launchUrl(UrlGenerator(twitterId).toTwitterHttpsScheme());
}

Future launchUrlInstagram(String instagramId) async {
  await launchUrl(UrlGenerator(instagramId).toInstagramHttpsScheme());
}
