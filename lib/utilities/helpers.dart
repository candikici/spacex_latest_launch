import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL({required String url, required BuildContext ctx}) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("This link cannot be played.")));
  }
}
