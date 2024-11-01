import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/Groups/controller/group_controller.dart';
import 'package:tcdesign/presentations/History/controller/history_controller.dart';
import 'package:tcdesign/presentations/profile/screens/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class GroupDetailsPage extends StatefulWidget {
  final GroupDetails group;

  GroupDetailsPage({required this.group});

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            centerTitle: false,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAdded = !isAdded; // Toggle the button state
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 18.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: isAdded ? Colors.green : Colors.red, // Change color
                            border: Border.all(color: Colors.white, width: 0.2.w),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              isAdded ? 'Add' : 'Leave', // Change text
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 2), // Optional: Adjust the space before the group name
                    Text(
                      widget.group.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // Center align text
                    ),
                    Spacer(flex: 2), // Optional: Adjust the space after the group name
                    // Group members count with icon
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.group_outlined,
                            color: Colors.white,
                            size: 22.sp, // Adjust the size as needed
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '${widget.group.members}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 1.5.h),

                // Gradient Box for Awards, My Awards, and Closest Match
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    double maxHeight = maxWidth * (400 / 350);

                    return Container(
                      width: maxWidth,
                      height: maxHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Color(0xFF5A099B), Colors.black],
                          stops: [0.38, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 1.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Awards Section
                          _buildAwardsSection(context, 'Awards', widget.group.awards),
                          // My Awards Section
                          _buildMyAwardsSection('My Awards', widget.group.myAwards),
                          // Closest Match
                          Column(
                            children: [
                              Stack(
                                children: [
                                  // Closest Match centered
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Closest Match",
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Month/Date aligned to the top-right corner
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      widget.group.closestMatch.month,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ), // Add space between texts

                              // Name of the closest match centered below
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePage()), // Replace with your profile page
                                    );
                                  },
                                  child: Text(
                                    widget.group.closestMatch.name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 2.h),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h),

                // Top Songs & Top Artists Heading Outside the Box
                Row(
                  children: [
                    // Left column for "Top Songs"
                    Expanded(
                      child: Center(
                        child: Text(
                          "Top Songs",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Right column for "Top Artists"
                    Expanded(
                      child: Center(
                        child: Text(
                          "Top Artists",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 1.h),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 20.h,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFE2E2FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTopSongs(widget.group.topSongs),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Container(
                        height: 20.h,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFE2E2FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTopArtists(widget.group.topArtists),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
        );
      },
    );
  }
}
  // Build Awards Section
Widget _buildMyAwardsSection(String title, List<Award> awards) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 18.sp, // Larger font as per your request
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Column(
        children: awards.take(3).map((award) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0.05.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      award.award,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Call the detailsAugust function from the controller
                        Get.find<HistoryController>().detailsAugust();
                      },
                      child: Text(
                        award.date,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300, // Set font weight to light
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.white, thickness: 0.05.h),
              ],
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Widget _buildAwardsSection(BuildContext context,String title, List<Award> awards) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp, // Larger font as per your request
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Column(
          children: awards.take(3).map((award) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 0.05.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        award.award,
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(), // The page to navigate to
                            ),
                          );
                        },
                        child: Text(
                          award.recipient,
                          style: TextStyle(fontSize: 10.sp, color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                  Divider(color: Colors.white, thickness: 0.05.h),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
// Build Top Songs with a Column and controlled spacing
// Build Top Songs with a Column and controlled spacing
Widget _buildTopSongs(List<Song> songs) {
  return Column(
    children: [
      for (int i = 0; i < (songs.length > 3 ? 3 : songs.length); i++)
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.3.h), // Control space between songs
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${i + 1}. ${songs[i].title.length > 20 ? songs[i].title.substring(0, 20) + "..." : songs[i].title}',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black), // Updated font size
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 2.w), // Space between text and icon
              GestureDetector(
                onTap: () => _launchSpotifyLink(songs[i].spotifyLink),
                child: Image.asset(
                  'assets/spotify_icon.png', // Spotify logo
                  height: 12.sp,
                  width: 12.sp,
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

Widget _buildTopArtists(List<Artist> artists) {
  return Column(
    children: [
      for (int i = 0; i < artists.length; i++)
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.3.h), // Control space between artists
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${i + 1}. ${artists[i].name}',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black), // Updated font size
                ),
              ),
              SizedBox(width: 2.w), // Space between text and icon
              GestureDetector(
                onTap: () {
                  if (artists[i].ArtistspotifyLink != null && artists[i].ArtistspotifyLink.isNotEmpty) {
                    _launchSpotifyLink(artists[i].ArtistspotifyLink);
                  } else {
                    print("No Spotify link available");
                  }
                },
                child: Image.asset(
                  'assets/spotify_icon.png', // Spotify logo
                  height: 12.sp,
                  width: 12.sp,
                ),
              )

            ],
          ),
        ),
    ],
  );
}

void _launchSpotifyLink(String spotifyLink) async {
  try {
    Uri uri = Uri.parse(spotifyLink);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    } else {
      print("Could not launch $spotifyLink");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}