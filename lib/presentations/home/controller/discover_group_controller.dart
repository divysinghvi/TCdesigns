// import 'package:get/get.dart';
//
// class DiscoverGroupsController extends GetxController {
//   var selectedSort = 'Members'.obs;
//   final List<String> sortOptions = ['Members', 'Name'];
//   final RxList<Map<String, dynamic>> groups = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchGroups();
//   }
//
//   void fetchGroups() {
//     // Mock data
//     groups.assignAll([
//       {'title': 'Walking', 'members': 32},
//       {'title': 'Driving', 'members': 124},
//       {'title': 'Sunset', 'members': 21},
//       {'title': 'Cooking', 'members': 234},
//       {'title': 'Snowboarding', 'members': 114},
//       {'title': 'Walking', 'members': 32},
//       {'title': 'Driving', 'members': 124},
//       {'title': 'Sunset', 'members': 21},
//       {'title': 'Cooking', 'members': 234},
//       {'title': 'Snowboarding', 'members': 114},
//       {'title': 'Walking', 'members': 32},
//       {'title': 'Driving', 'members': 124},
//       {'title': 'Sunset', 'members': 21},
//       {'title': 'Cooking', 'members': 234},
//       {'title': 'Snowboarding', 'members': 114},
//
//     ]);
//   }
//
//   void onSortChanged(String? newValue) {
//     selectedSort.value = newValue!;
//     sortGroups();
//   }
//
//   void sortGroups() {
//     if (selectedSort.value == 'Members') {
//       groups.sort((a, b) => b['members'].compareTo(a['members']));
//     } else if (selectedSort.value == 'Name') {
//       groups.sort((a, b) => a['title'].compareTo(b['title']));
//     }
//   }
// }
import 'package:get/get.dart';

class DiscoverGroupsController extends GetxController {
  var selectedSort = 'Members'.obs;
  final List<String> sortOptions = ['Members', 'Name'];
  final RxList<Map<String, dynamic>> groups = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;  // Loading state
  var hasError = false.obs;  // Error state

  @override
  void onInit() {
    super.onInit();
    fetchGroups();
  }

  Future<void> fetchGroups() async {
    try {
      print("Fetching groups...");
      isLoading(true);
      hasError(false);

      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Mock data (Replace this with actual API call)
      groups.assignAll([
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
        {'title': 'Basketball', 'members': 32},
      ]);

      print("Groups fetched successfully.");
    } catch (error) {
      print("Error fetching groups: $error");
      hasError(true);
    } finally {
      isLoading(false);
      print("Loading state set to false.");
    }
  }

  void onSortChanged(String? newValue) {
    selectedSort.value = newValue!;
    sortGroups();
  }

  void sortGroups() {
    if (selectedSort.value == 'Members') {
      groups.sort((a, b) => b['members'].compareTo(a['members']));
    } else if (selectedSort.value == 'Name') {
      groups.sort((a, b) => a['title'].compareTo(b['title']));
    }
  }
}
