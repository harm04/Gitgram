// ignore_for_file: unnecessary_this, prefer_collection_literals, duplicate_ignore

class UserReposModel {
  int? id;

  String? name;
  String? fullName;

  Owner? owner;
  String? htmlUrl;
  String? description;

  String? url;

  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;

  int? stargazersCount;
  int? watchersCount;

  int? watchers;

  UserReposModel({
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.stargazersCount,
    this.watchersCount,
    this.watchers,
  });

  UserReposModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    url = json['url'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];

    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];

    watchers = json['watchers'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['url'] = this.url;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pushed_at'] = this.pushedAt;
    data['git_url'] = this.gitUrl;

    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;

    data['watchers'] = this.watchers;

    return data;
  }
}

class Owner {
  String? login;
  int? id;
  String? avatarUrl;
  String? url;
  String? htmlUrl;

  String? reposUrl;

  Owner({
    this.login,
    this.id,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.reposUrl,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];

    reposUrl = json['repos_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;

    data['repos_url'] = this.reposUrl;

    return data;
  }
}
