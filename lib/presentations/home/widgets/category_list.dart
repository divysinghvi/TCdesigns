import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryList extends StatefulWidget {
  final String category;
  final List<Map<String, dynamic>> items;

  CategoryList({required this.category, required this.items});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> with WidgetsBindingObserver {
  bool _isExpanded = false;
  AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _audioPlayer.pause();
    }
  }

  // Play or pause the song
  void _togglePlayPause(int index, String mp3Link) async {
    if (_currentlyPlayingIndex == index) {
      await _audioPlayer.pause();
      setState(() {
        _currentlyPlayingIndex = null;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(mp3Link));
      setState(() {
        _currentlyPlayingIndex = index;
      });

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() {
          _currentlyPlayingIndex = null;
        });
      });
    }
  }

  // Open Spotify link using url_launcher
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_isExpanded ? 10.sp : 0),
                topRight: Radius.circular(_isExpanded ? 10.sp : 0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.remove : Icons.add,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded && widget.items.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: AppColors.groupCardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
            child: Column(
              children: widget.items.asMap().entries.map((entry) {
                int idx = entry.key;
                var item = entry.value;

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.groupCardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(idx == 0 ? 10.sp : 0),
                          topRight: Radius.circular(idx == 0 ? 10.sp : 0),
                          bottomLeft: Radius.circular(
                              idx == widget.items.length - 1 ? 10.sp : 0),
                          bottomRight: Radius.circular(
                              idx == widget.items.length - 1 ? 10.sp : 0),
                        ),
                      ),
                      child: ListTile(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 0),
                        leading: GestureDetector(
                          onTap: () => _launchSpotifyLink(item['spotify_link']),
                          child: Image.asset(
                            'assets/spotify_icon.png', // Spotify logo
                            height: 16.sp,
                            width: 16.sp,
                          ),
                        ),
                        title: Text(
                          item['title'],
                          style: TextStyle(
                            color: AppColors.primaryPurple,
                            fontSize: 10.sp,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            _currentlyPlayingIndex == idx
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                          onPressed: () {
                            _togglePlayPause(idx, item['mp3_link']);
                          },
                        ),
                      ),
                    ),
                    if (idx < widget.items.length - 1)
                      Divider(
                        color: AppColors.primaryPurple,
                        thickness: 1,
                        height: 0.01,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
