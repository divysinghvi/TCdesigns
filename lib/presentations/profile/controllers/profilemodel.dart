class Profile {
  String? username;
  String? joinedDate;
  int? friendsCount;
  int? points;
  String? statusMessage;
  List<Awards>? awards;

  Profile(
      {this.username,
      this.joinedDate,
      this.friendsCount,
      this.points,
      this.statusMessage,
      this.awards});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    joinedDate = json['joined_date'];
    friendsCount = json['friends_count'];
    points = json['points'];
    statusMessage = json['status_message'];
    if (json['awards'] != null) {
      awards = <Awards>[];
      json['awards'].forEach((v) {
        awards!.add(new Awards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['joined_date'] = this.joinedDate;
    data['friends_count'] = this.friendsCount;
    data['points'] = this.points;
    data['status_message'] = this.statusMessage;
    if (this.awards != null) {
      data['awards'] = this.awards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Awards {
  String? title;
  String? category;

  Awards({this.title, this.category});

  Awards.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    return data;
  }
}