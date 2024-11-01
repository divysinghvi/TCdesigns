import 'package:get/get.dart';

class HomeController extends GetxController {
  var categories = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Simulating API call with mock data
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Replace this with the real API call later
    return [
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      {
        'name': 'Basketball',
        'items': [
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
          {
            'title': 'BEEPER - ASAP ROCKY',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
          },
          {
            'title': 'She Knows - J. Cole',
            'mp3_link': 'https://p.scdn.co/mp3-preview/ecc6383aac4b3f4240ae699324573e61c39e6aaf?cid=cfe923b2d660439caf2b557b21f31221',
            'spotify_link': 'https://open.spotify.com/track/0Fs9cdPDhptWEDJmiCbkEW?si=iPoj7Be-TWqYf1noVlT7Zg'
          },
        ]
      },
      // Add more categories with songs and MP3 links
    ];
  }
}
