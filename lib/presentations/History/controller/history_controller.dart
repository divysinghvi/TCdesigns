import 'package:get/get.dart';
import 'package:tcdesign/network/models/history_model.dart';

import '../screens/detail_page.dart'; // Import your model

class HistoryController extends GetxController {
  var historyList = <HistoryModel>[].obs; // Reactive history list

  @override
  void onInit() {
    super.onInit();
    loadHistoryData(); // Load history data on initialization
  }

  void loadHistoryData() {
    // Simulated JSON API response (replace with actual API call)
    var jsonResponse = [
      {
        "month": "August 2024",
        "pointsEarned": 1500,
        "groupsAndAwards": [
          {
            "group": "Basketball",
            "match": "marc",
            "awards": [
              {"title": "Top Listener", "points": 25},
              {"title": "Party Award", "points": 7}
            ]
          },
          {
            "group": "Football",
            "match": "marc",
            "awards": [
              {"title": "Top Scorer", "points": 50},
              {"title": "Best Player", "points": 10}
            ]
          },
          {
            "group": "Basketball",
            "match": "marc",
            "awards": [
              {"title": "Top Listener", "points": 25},
              {"title": "Party Award", "points": 7}
            ]
          },
          {
            "group": "Football",
            "match": "marc",
            "awards": [
              {"title": "Top Scorer", "points": 50},
              {"title": "Best Player", "points": 10}
            ]
          },
          {
            "group": "Basketball",
            "match": "marc",
            "awards": [
              {"title": "Top Listener", "points": 25},
              {"title": "Party Award", "points": 7}
            ]
          },

          {
            "group": "Football",
            "match": "marc",
            "awards": [
              {"title": "Top Scorer", "points": 50},
              {"title": "Best Player", "points": 10}
            ]
          }
        ],
        "topSongs": [
          {"rank": 1, "title": "Sunset", "artist": "Quinn XCII", "spotifyLink": "https://open.spotify.com/track/1"},
          {"rank": 2, "title": "in the valley...", "artist": "danger", "spotifyLink": "https://open.spotify.com/track/2"},
          {"rank": 2, "title": "in the valley...", "artist": "danger", "spotifyLink": "https://open.spotify.com/track/2"}
        ],
        "topArtists": [
          {"rank": 1, "name": "Bad Bunny", "spotifyLink": "https://open.spotify.com/artist/1"},
          {"rank": 2, "name": "Drake", "spotifyLink": "https://open.spotify.com/artist/2"},
          {"rank": 1, "name": "Bad Bunny", "spotifyLink": "https://open.spotify.com/artist/1"},
        ]
      },
      {
        "month": "September 2024",
        "pointsEarned": 1800,
        "groupsAndAwards": [],
        "topSongs": [],
        "topArtists": []
      }
    ];

    // Map the response to HistoryModel objects
    var historyData = jsonResponse.map((json) => HistoryModel.fromJson(json)).toList();
    historyList.addAll(historyData); // Add the parsed data to the reactive list
  }

  void navigateToDetailPage(int index) {
    // Pass the selected history item to the detail page
    if (index >= 0 && index < historyList.length) {
      Get.toNamed('/detail', arguments: historyList[index]);
    }
  }
  void detailsAugust() {
    // Find the August 2024 history data
    var augustHistory = historyList.firstWhereOrNull((history) => history.month == 'August 2024');

    // Ensure we found the data for August 2024
    if (augustHistory != null) {
      // Navigate to the HistoryDetailsPage, passing the August history data
      Get.to(() => AwardDetailsPage(history: augustHistory));
    } else {
      Get.snackbar('Error', 'August 2024 history not found');
    }
  }


}
