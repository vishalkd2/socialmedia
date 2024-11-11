class UserModel {
  List<Profile>? profile;

  UserModel({this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(new Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  String? userProfilePic;
  String? userName;
  String? userLocation;
  String? nationFlag;
  String? userPosition;
  String? userDescription;
  List<Photos>? photos;

  Profile(
      {this.userProfilePic,
        this.userName,
        this.userLocation,
        this.nationFlag,
        this.userPosition,
        this.userDescription,
        this.photos});

  Profile.fromJson(Map<String, dynamic> json) {
    userProfilePic = json['userProfilePic'];
    userName = json['userName'];
    userLocation = json['userLocation'];
    nationFlag = json['nationFlag'];
    userPosition = json['userPosition'];
    userDescription = json['userDescription'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userProfilePic'] = this.userProfilePic;
    data['userName'] = this.userName;
    data['userLocation'] = this.userLocation;
    data['nationFlag'] = this.nationFlag;
    data['userPosition'] = this.userPosition;
    data['userDescription'] = this.userDescription;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  String? photoUrl;
  String? photoTitle;

  Photos({this.photoUrl, this.photoTitle});

  Photos.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    photoTitle = json['photoTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photoUrl'] = this.photoUrl;
    data['photoTitle'] = this.photoTitle;
    return data;
  }
}
