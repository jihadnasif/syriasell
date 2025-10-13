class CommentModel {
  int? id;
  String? targetType;
  int? targetId;
  int? userId;
  String? userName;
  int? parentId;
  String? content;
  String? createdAt;

  CommentModel(
      {this.id,
      this.targetType,
      this.targetId,
      this.userId,
      this.userName,
      this.parentId,
      this.content,
      this.createdAt});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    targetType = json['target_type'];
    targetId = json['target_id'];
    userId = json['user_id'];
    userName = json["name"];
    parentId = json['parent_id'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['target_type'] = this.targetType;
    data['target_id'] = this.targetId;
    data['user_id'] = this.userId;
    data['name'] = this.userName;
    data['parent_id'] = this.parentId;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}
