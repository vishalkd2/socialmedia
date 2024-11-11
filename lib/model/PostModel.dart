
class PostModel {
  final String userProfilePic;
  final String userName;
  final String userLocation;
  final String nationFlag;
  final String userPosition;
  final String userDescription;
  final List<Post> posts;

  PostModel({
    required this.userProfilePic,
    required this.userName,
    required this.userLocation,
    required this.nationFlag,
    required this.userPosition,
    required this.userDescription,
    required this.posts,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    var postsList = (json['posts'] as List)
        .map((post) => Post.fromJson(post))
        .toList();

    return PostModel(
      userProfilePic: json['userProfilePic'],
      userName: json['userName'],
      userLocation: json['userLocation'],
      nationFlag: json['nationFlag'],
      userPosition: json['userPosition'],
      userDescription: json['userDescription'],
      posts: postsList,
    );
  }
}

// post.dart
class Post {
  final String postTitle;
  final String postDescription;
  final String postImage;
  final String postDateTime;
  final List<String> likes;
  final List<Comment> comments;

  Post({
    required this.postTitle,
    required this.postDescription,
    required this.postImage,
    required this.postDateTime,
    required this.likes,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var commentsList = (json['comments'] as List)
        .map((comment) => Comment.fromJson(comment))
        .toList();
    return Post(
      postTitle: json['postTitle'],
      postDescription: json['postDescription'],
      postImage: json['postImage'],
      postDateTime: json['postDateTime'],
      likes: List<String>.from(json['likes']),
      comments: commentsList,
    );
  }
}

// comment.dart
class Comment {
  final String user;
  final String comment;

  Comment({
    required this.user,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: json['user'],
      comment: json['comment'],
    );
  }
}
