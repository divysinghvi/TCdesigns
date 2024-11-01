import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyLinkLauncher extends StatelessWidget {
  final String spotifyLink;

  SpotifyLinkLauncher({required this.spotifyLink});

  Future<void> _launchSpotifyLink() async {
    try {
      Uri uri = Uri.parse(spotifyLink);
      if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchSpotifyLink();
      },
      child: Text("Open Spotify"),
    );
  }
}
