import 'package:get/get.dart';
import 'dart:async';

import 'package:tcdesign/presentations/Groups/screens/group_details_screen.dart';

// Model for Group details (Awards, Songs, Artists, etc.)

class GroupDetails {
  final String name;
  final int members;  // Number of members in the group
  final List<Award> awards;
  final List<Award> myAwards;
  final Match closestMatch;
  final List<Song> topSongs;
  final List<Artist> topArtists;

  GroupDetails({
    required this.name,
    required this.members,
    required this.awards,
    required this.myAwards,
    required this.closestMatch,
    required this.topSongs,
    required this.topArtists,
  });

  // Method to create mock data from a map (mimicking an API response)
  factory GroupDetails.fromJson(Map<String, dynamic> json) {
    return GroupDetails(
      name: json['name'],
      members: json['members'],
      awards: (json['awards'] as List)
          .map((award) => Award.fromJson(award))
          .toList(),
      myAwards: (json['myAwards'] as List)
          .map((award) => Award.fromJson(award))
          .toList(),
      closestMatch: Match.fromJson(json['closestMatch']),
      topSongs: (json['topSongs'] as List)
          .map((song) => Song.fromJson(song))
          .toList(),
      topArtists: (json['topArtists'] as List)
          .map((artist) => Artist.fromJson(artist))
          .toList(),
    );
  }
}

// Model for Awards
class Award {
  final String award;
  final String date;
  final String recipient;

  Award({required this.award, required this.date, required this.recipient});

  // Factory method to create from JSON
  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      award: json['award'],
      date: json['date'],
      recipient: json['recipient'],
    );
  }
}

// Model for Closest Match
class Match {
  final String month;
  final String name;

  Match({required this.month, required this.name});

  // Factory method to create from JSON
  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      month: json['month'],
      name: json['name'],
    );
  }
}

// Model for Song
class Song {
  final String title;
  final String spotifyLink;

  Song({required this.title, required this.spotifyLink});

  // Factory method to create from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      spotifyLink: json['spotify_link'], // Parse the Spotify link from the JSON
    );
  }
}

// Model for Artist
class Artist {
  final String name;
  final String ArtistspotifyLink;  // Keeping the custom field name

  Artist({required this.name, required this.ArtistspotifyLink});

  // Factory method to create from JSON
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'] ?? 'Unknown Artist',
      ArtistspotifyLink: json['artist_spotify_link'] ?? '', // Provide a default value
    );
  }

}

class GroupsController extends GetxController {
  var groups = <GroupDetails>[].obs;
  var selectedSort = 'Name'.obs; // Reactive variable for selected sort option
  List<String> sortOptions = ['Name', 'Members']; // List of sort options

  @override
  void onInit() {
    super.onInit();
    fetchGroups(); // Simulate API call
  }

  // Simulate an API response with Future
  Future<void> fetchGroups() async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Mock API response data (replace this with actual API call later)
      final List<Map<String, dynamic>> responseData = [
        {
          'name': 'Basketball',
          'members': 324,
          'awards': [
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'marc'},
            {'award': 'Party Award', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Repeat Offender', 'date': 'June 2024', 'recipient': 'marc'},
          ],
          'myAwards': [
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
          ],
          'closestMatch': {'month': 'June 2024', 'name': 'marc'},
          'topSongs': [
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'In the Valley-danger',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
          ],
          'topArtists': [
            {
              'name': 'Bad Bunny',
              'artist_spotify_link': 'https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X'
            },
            {
              'name': 'Drake',
              'artist_spotify_link': 'https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4?si=wJq5ppxgQPiVddpl-K9YuQ'
            },
            {
              'name': 'The Weekend',
              'artist_spotify_link': 'https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ'
            },
          ],

        },
        {
          'name': 'Cricket',
          'members': 34,
          'awards': [
            {'award': 'Top Listener', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Party Award', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Repeat Offender', 'date': 'June 2024', 'recipient': 'marc'},
          ],
          'myAwards': [
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
          ],
          'closestMatch': {'month': 'June 2024', 'name': 'marc'},
          'topSongs': [
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'In the Valley-danger',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
          ],
          'topArtists': [
            {
              'name': 'Bad Bunny',
              'artist_spotify_link': 'https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X'
            },
            {
              'name': 'Drake',
              'artist_spotify_link': 'https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4?si=wJq5ppxgQPiVddpl-K9YuQ'
            },
            {
              'name': 'The Weekend',
              'artist_spotify_link': 'https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ'
            },
          ],

        },
        {
          'name': 'Baseball',
          'members': 34,
          'awards': [
            {'award': 'Top Listener', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Party Award', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Repeat Offender', 'date': 'June 2024', 'recipient': 'marc'},
          ],
          'myAwards': [
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
          ],
          'closestMatch': {'month': 'June 2024', 'name': 'marc'},
          'topSongs': [
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'In the Valley-danger',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
          ],
          'topArtists': [
            {
              'name': 'Bad Bunny',
              'artist_spotify_link': 'https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X'
            },
            {
              'name': 'Drake',
              'artist_spotify_link': 'https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4?si=wJq5ppxgQPiVddpl-K9YuQ'
            },
            {
              'name': 'The Weekend',
              'artist_spotify_link': 'https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ'
            },
          ],

        },
        {
          'name': 'Coding',
          'members': 3241,
          'awards': [
            {'award': 'Top Listener', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Party Award', 'date': 'June 2024', 'recipient': 'marc'},
            {'award': 'Repeat Offender', 'date': 'June 2024', 'recipient': 'marc'},
          ],
          'myAwards': [
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
            {'award': 'Top Listener', 'date': 'August 2024', 'recipient': 'myself'},
          ],
          'closestMatch': {'month': 'June 2024', 'name': 'marc'},
          'topSongs': [
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'In the Valley-danger',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
            {
              'title': 'Sunset-Quinn xcii',
              'spotify_link': 'https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A'
            },
          ],
          'topArtists': [
            {
              'name': 'Bad Bunny',
              'artist_spotify_link': 'https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X'
            },
            {
              'name': 'Drake',
              'artist_spotify_link': 'https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4?si=wJq5ppxgQPiVddpl-K9YuQ'
            },
            {
              'name': 'The Weekend',
              'artist_spotify_link': 'https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ'
            },
          ],

        },
        // Add more group entries here...
      ];

      // Assign the parsed response data to the groups observable
      groups.assignAll(responseData.map((data) => GroupDetails.fromJson(data)).toList());
    } catch (e) {
      print('Error fetching group details: $e');
    }
  }

  void onSortChanged(String? newValue) {
    if (newValue != null) {
      selectedSort.value = newValue;
      _sortGroups();
    }
  }

  void _sortGroups() {
    switch (selectedSort.value) {
      case 'Name':
        groups.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Members':
        groups.sort((a, b) => a.members.compareTo(b.members));
        break;
    }
  }
  void showGroupDetails(String groupName) {
    GroupDetails? group = groups.firstWhereOrNull((group) => group.name == groupName);
    if (group != null) {
      Get.to(() => GroupDetailsPage(group: group));
    } else {
      Get.snackbar('Error', 'Group not found');
    }
  }
  void detailsBasketball() {
    GroupDetails? basketballGroup = groups.firstWhereOrNull((group) => group.name == 'Basketball');

    if (basketballGroup != null) {
      Get.to(() => GroupDetailsPage(group: basketballGroup));
    } else {
      Get.snackbar('Error', 'Basketball group not found');
    }
  }

}


