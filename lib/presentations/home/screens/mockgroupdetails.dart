import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/profile/screens/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class MockGroupDetailsPage extends StatelessWidget {
  // Static data for MockGroupDetails
  final String groupName = "Basketball";
  final int groupMembers = 324;
  final List<Award> awards = [
    Award(award: "Top Listener", date: "June 2024", recipient: "marc"),
    Award(award: "Party Award", date: "June 2024", recipient: "marc"),
    Award(award: "Repeat Offender", date: "June 2024", recipient: "marc"),
  ];
  final List<Award> myAwards = [
    Award(award: "Top Listener", date: "June 2024", recipient: "myself"),
    Award(award: "Top Listener", date: "April 2024", recipient: "myself"),
    Award(award: "Top Listener", date: "May 2024", recipient: "myself"),
  ];
  final ClosestMatch closestMatch = ClosestMatch(month: "June 2024", name: "marc");
  final List<Song> topSongs = [
    Song(
      title: "Sunset-Quinn xcii",
      spotifyLink: "https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A",
    ),
    Song(
      title: "In the Valley-danger",
      spotifyLink: "https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A",
    ),
    Song(
      title: "Sunset-Quinn xcii",
      spotifyLink: "https://open.spotify.com/track/5TX0mfUkpGlU6j2xa00ERx?si=Ii-3MOEaTCaspQHF4UT-1A",
    ),
  ];
  final List<Artist> topArtists = [
    Artist(
      name: "Bad Bunny",
      artistSpotifyLink: "https://open.spotify.com/artist/4q3ewBCX7sLwd24euuV69X",
    ),
    Artist(
      name: "Drake",
      artistSpotifyLink: "https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4?si=wJq5ppxgQPiVddpl-K9YuQ",
    ),
    Artist(
      name: "The Weekend",
      artistSpotifyLink: "https://open.spotify.com/artist/1Xyo4u8uXC1ZmMpatF05PJ",
    ),
  ];

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
                        print('Add button tapped!');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 18.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.white, width: 0.2.w),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      groupName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.group_outlined,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '$groupMembers',
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth * 1;
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAwardsSection(context, 'Awards', awards),
                          _buildMyAwardsSection(context, 'My Awards', myAwards),
                          Column(
                            children: [
                              Stack(
                                children: [
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
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      closestMatch.month,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProfilePage()),
                                    );
                                  },
                                  child: Text(
                                    closestMatch.name,
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
                Row(
                  children: [
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
                            _buildTopSongs(topSongs),
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
                            _buildTopArtists(topArtists),
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

  // Build My Awards Section
  Widget _buildMyAwardsSection(BuildContext context, String title, List<Award> awards) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
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
                        style: TextStyle(fontSize: 12.sp, color: Colors.yellow),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage()),
                          );
                        },
                        child: Text(
                          award.recipient,
                          style: TextStyle(fontSize: 12.sp, color: Colors.yellow),
                        ),
                      ),
                      Text(
                        award.date,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
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

  // Build Awards Section
  Widget _buildAwardsSection(BuildContext context, String title, List<Award> awards) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
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
                        style: TextStyle(fontSize: 12.sp, color: Colors.yellow),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage()),
                          );
                        },
                        child: Text(
                          award.recipient,
                          style: TextStyle(fontSize: 12.sp, color: Colors.yellow),
                        ),
                      ),
                      Text(
                        award.date,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
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

  // Build Top Songs Section
  Widget _buildTopSongs(List<Song> songs) {
    return Column(
      children: songs.map((song) {
        return GestureDetector(
          onTap: () async {
            if (await canLaunch(song.spotifyLink)) {
              await launch(song.spotifyLink);
            } else {
              throw 'Could not launch ${song.spotifyLink}';
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.05.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/8/1e/Spotify_logo_without_text.svg',
                      width: 12.sp,
                      height: 12.sp,
                    ),
                    SizedBox(width: 5),
                    Text(
                      song.title,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
                Icon(
                  Icons.open_in_new,
                  size: 12.sp,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Build Top Artists Section
  Widget _buildTopArtists(List<Artist> artists) {
    return Column(
      children: artists.map((artist) {
        return GestureDetector(
          onTap: () async {
            if (await canLaunch(artist.artistSpotifyLink)) {
              await launch(artist.artistSpotifyLink);
            } else {
              throw 'Could not launch ${artist.artistSpotifyLink}';
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.05.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/8/1e/Spotify_logo_without_text.svg',
                      width: 12.sp,
                      height: 12.sp,
                    ),
                    SizedBox(width: 5),
                    Text(
                      artist.name,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
                Icon(
                  Icons.open_in_new,
                  size: 12.sp,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Award {
  final String award;
  final String recipient;
  final String date;

  Award({required this.award, required this.recipient, required this.date});
}

class Song {
  final String title;
  final String spotifyLink;

  Song({required this.title, required this.spotifyLink});
}

class Artist {
  final String name;
  final String artistSpotifyLink;

  Artist({required this.name, required this.artistSpotifyLink});
}

class ClosestMatch {
  final String name;
  final String month;

  ClosestMatch({required this.name, required this.month});
}
