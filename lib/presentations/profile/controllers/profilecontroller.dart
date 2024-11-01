import 'package:get/get.dart';
import 'package:tcdesign/presentations/profile/controllers/profilemodel.dart';
// Import the model

class ProfileController extends GetxController {
  var profile = Profile(
    username: "",
    joinedDate: "",
    friendsCount: 0,
    points: 0,
    statusMessage: "",
    awards: [],
  ).obs;
  var isAutoCreateEnabled = false.obs; // Initially set to false

  // Function to toggle the auto-create playlist feature
  void toggleAutoCreate(bool value) {
    isAutoCreateEnabled.value = value;
    // Perform any additional actions here (e.g., saving this setting)
    print('Auto Create Monthly Playlist is: $value');
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  // Mock method to fetch profile data (this simulates an API call)
  void fetchProfile() {
    final jsonResponse = {
      "username": "marc_",
      "joined_date": "Dec, 2023",
      "friends_count": 35,
      "points": 1205,
      "status_message": "Tropical Vibe 🌴",
      "awards": [
        {"title": "Top Listener", "category": "Basketball"},
        {"title": "Top Listener", "category": "Basketball"},
        {"title": "Top Listener", "category": "Basketball"},
        {"title": "Top Listener", "category": "Basketball"},
        {"title": "Top Listener", "category": "Basketball"}
      ]
    };

    profile.value = Profile.fromJson(jsonResponse);
  }

  void logout() {}
}
