class UsersFriendsModel {
  String? login;
  int? id;

  String? avatarUrl;

  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;

  UsersFriendsModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
  });

  UsersFriendsModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;

    return data;
  }
}
