// ignore_for_file: prefer_collection_literals, unnecessary_this

class UserTimelineModel {
  String? id;
  String? type;
  Actor? actor;
  Repo? repo;

  String? createdAt;

  UserTimelineModel(
      {this.id, this.type, this.actor, this.repo, this.createdAt});

  UserTimelineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor'] != null ? Actor.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? Repo.fromJson(json['repo']) : null;

    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actor != null) {
      data['actor'] = this.actor!.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo!.toJson();
    }

    data['created_at'] = this.createdAt;
    return data;
  }
}

class Actor {
  int? id;
  String? login;

  String? url;
  String? avatarUrl;

  Actor({this.id, this.login, this.url, this.avatarUrl});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];

    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;

    data['url'] = this.url;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Repo {
  int? id;
  String? name;
  String? url;

  Repo({this.id, this.name, this.url});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
