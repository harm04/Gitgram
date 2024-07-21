// ignore_for_file: unnecessary_this

class SearchRepoModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  SearchRepoModel({this.totalCount, this.incompleteResults, this.items});

  SearchRepoModel.fromJson(Map<String, dynamic> json) {
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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;

  String? name;
  String? fullName;

  Owner? owner;
  String? htmlUrl;
  String? description;

  String? url;

  String? downloadsUrl;

  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;
 
  String? homepage;
 int? stargazersCount;
  int? watchersCount;
 


  Items(
      {this.id,
    
      this.name,
      this.fullName,
    
      this.owner,
      this.htmlUrl,
      this.description,
    
      this.url,
     
      this.downloadsUrl,
      
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.gitUrl,
     
      this.homepage,
      this.stargazersCount,
      this.watchersCount,
     });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
 
    name = json['name'];
    fullName = json['full_name'];
   
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
  
    url = json['url'];
   
    downloadsUrl = json['downloads_url'];
  
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
   
    homepage = json['homepage'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;

    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;

    data['url'] = this.url;
 
    data['downloads_url'] = this.downloadsUrl;
   
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pushed_at'] = this.pushedAt;
    data['git_url'] = this.gitUrl;
   
    data['homepage'] = this.homepage;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;

    return data;
  }
}

class Owner {
  String? login;
  int? id;

  String? avatarUrl;
  
  String? url;
  String? htmlUrl;


  Owner(
      {this.login,
      this.id,

      this.avatarUrl,
    
      this.url,
      this.htmlUrl,
     });

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    
    avatarUrl = json['avatar_url'];
   
    url = json['url'];
    htmlUrl = json['html_url'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = this.login;
    data['id'] = this.id;

    data['avatar_url'] = this.avatarUrl;

    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;

    return data;
  }
}

