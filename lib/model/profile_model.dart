class ProfileModel {
  String? login;
  int? id;

  String? avatarUrl;

  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;

  String? reposUrl;
  String? eventsUrl;

  String? location;


  String? bio;
int? publicRepos;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  ProfileModel(
      {this.login,
      this.id,
      this.avatarUrl,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.reposUrl,
      this.eventsUrl,
      this.location,
     
      this.bio,
      this.publicRepos,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];

    avatarUrl = json['avatar_url'];

    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];

    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];

    location = json['location'];
   
    bio = json['bio'];
 publicRepos = json['public_repos'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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

    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;

    data['location'] = location;
 
    data['bio'] = bio;
data['public_repos'] = publicRepos;
    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
