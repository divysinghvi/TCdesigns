import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/network/models/history_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AwardDetailsPage extends StatefulWidget {
  final HistoryModel history;

  AwardDetailsPage({required this.history});

  @override
  _AwardDetailsPageState createState() => _AwardDetailsPageState();
}

class _AwardDetailsPageState extends State<AwardDetailsPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.history.groupsAndAwards.length / 2).ceil();
    totalPages = totalPages > 5 ? 5 : totalPages; // Cap the total pages to 5

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.history.month + " Stats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 1.h),
                Text(
                  '✨ ${widget.history.pointsEarned} ✨ points earned',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (widget.history.groupsAndAwards.isNotEmpty)
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: totalPages,
                            itemBuilder: (context, index) {
                              return _buildGroupAwardsSlide(index);
                            },
                          ),
                        ),

                        // Page indicator with content number
                        // Page indicator with content number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color for the rectangle
                                borderRadius: BorderRadius.circular(20), // Rounded edges
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp), // Padding inside the rectangle
                              child: Row(
                                children: [
                                  // Create a maximum of 3 dots
                                  ...List.generate(
                                    totalPages > 3 ? 3 : totalPages,
                                        (index) => _buildPageIndicator(isActive: index == _currentPage % 3),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    '${_currentPage + 1} / $totalPages',
                                    style: TextStyle(color: Colors.black), // Adjust text color as needed
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                SizedBox(height: 2.h),

                // Top Songs & Top Artists Section
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Top Songs",
                          style: TextStyle(
                            fontSize: 16.sp,
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),

                // Top Songs and Top Artists List
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
                        child: _buildTopSongs(widget.history.topSongs),
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
                        child: _buildTopArtists(widget.history.topArtists),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
              ],


            ),
          ),
          backgroundColor: AppColors.backgroundColor,
        );
      },
    );
  }

  Widget _buildGroupAwardsSlide(int slideIndex) {
    int startIndex = slideIndex * 2;
    List<GroupAndAward> slideGroups = widget.history.groupsAndAwards
        .skip(startIndex)
        .take(2)
        .toList();

    return FractionallySizedBox(
      heightFactor: 0.87,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xFF5A099B),
              Color(0xFF1F0335),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.58, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: slideGroups.map((groupData) {
            return _buildGroupAwardsSection(groupData);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildGroupAwardsSection(GroupAndAward groupData) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupData.group,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Closest Match:",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8), // Add a spacer between the texts
              GestureDetector(
                onTap: ()=>{},
                child: Text(
                  groupData.match,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: groupData.awards.map((award) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      award.title,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                    Text(
                      '${award.points} ✨',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Divider(color: Colors.white, thickness: 0.1.h),
        ],
      ),
    );
  }

  Widget _buildTopSongs(List<Song> topSongs) {
    return Column(
      children: topSongs.map((song) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                song.title,
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
              GestureDetector(
                onTap: () => _launchSpotifyLink(song.spotifyLink),
                child: Image.asset(
                  'assets/spotify_icon.png',
                  height: 12.sp,
                  width: 12.sp,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTopArtists(List<Artist> topArtists) {
    return Column(
      children: topArtists.map((artist) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                artist.name,
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
              GestureDetector(
                onTap: () => _launchSpotifyLink(artist.spotifyLink),
                child: Image.asset(
                  'assets/spotify_icon.png',
                  height: 12.sp,
                  width: 12.sp,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPageIndicator({required bool isActive}) {
    return Container(
      width: 10.sp,
      height: 10.sp,
      margin: EdgeInsets.symmetric(horizontal: 2.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color(0xFF5A099B) : Color(0xFFD1C4E9),
      ),
    );
  }

  void _launchSpotifyLink(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
