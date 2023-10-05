import 'package:url_launcher/url_launcher.dart';

Future openWhatsChat() async {
  var url = 'https://www.linkedin.com/in/karim-mokhtar-31254725a';
  await launchUrl(Uri.parse(url));
}
