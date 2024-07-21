// ignore_for_file: prefer_collection_literals

class SearchUserModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  SearchUserModel({this.totalCount, this.incompleteResults, this.items});

  SearchUserModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_count'] = totalCount;
    data['incomplete_results'] = incompleteResults;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? login;
  int? id;
  String? avatarUrl;
  String? url;
 String? htmlUrl;
  String? followersUrl;
  String? followingUrl;

  Items({
    this.login,
    this.id,
    this.avatarUrl,
    this.url,
      this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
  });

  Items.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
  }

  Map<String, dynamic> toJson() {
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
