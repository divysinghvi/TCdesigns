class HistoryModel {
  final String month;
  final int pointsEarned;
  final List<GroupAndAward> groupsAndAwards;
  final List<Song> topSongs;
  final List<Artist> topArtists;

  HistoryModel({
    required this.month,
    required this.pointsEarned,
    required this.groupsAndAwards,
    required this.topSongs,
    required this.topArtists,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      month: json['month'] as String,
      pointsEarned: json['pointsEarned'] as int? ?? 0,
      groupsAndAwards: (json['groupsAndAwards'] as List)
          .map((group) => GroupAndAward.fromJson(group))
          .toList(),
      topSongs: (json['topSongs'] as List)
          .map((song) => Song.fromJson(song))
          .toList(),
      topArtists: (json['topArtists'] as List)
          .map((artist) => Artist.fromJson(artist))
          .toList(),
    );
  }
}

class GroupAndAward {
  final String group;
  final String match;
  final List<Award> awards;

  GroupAndAward({
    required this.group,
    required this.match,
    required this.awards,
  });

  factory GroupAndAward.fromJson(Map<String, dynamic> json) {
    return GroupAndAward(
      group: json['group'] as String,
      match: json['match'] as String,
      awards: (json['awards'] as List)
          .map((award) => Award.fromJson(award))
          .toList(),
    );
  }
}

class Award {
  final String title;
  final int points;

  Award({
    required this.title,
    required this.points,
  });

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      title: json['title'] as String,
      points: json['points'] as int? ?? 0,
    );
  }
}

class Song {
  final int rank;
  final String title;
  final String artist;
  final String spotifyLink;

  Song({
    required this.rank,
    required this.title,
    required this.artist,
    required this.spotifyLink,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      rank: json['rank'] as int,
      title: json['title'] as String,
      artist: json['artist'] as String,
      spotifyLink: json['spotifyLink'] as String,
    );
  }
}

class Artist {
  final int rank;
  final String name;
  final String spotifyLink;

  Artist({
    required this.rank,
    required this.name,
    required this.spotifyLink,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      rank: json['rank'] as int,
      name: json['name'] as String,
      spotifyLink: json['spotifyLink'] as String,
    );
  }
}
