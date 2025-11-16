// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddPagesModel {
  final List<AddPagesModelItem> items;

  AddPagesModel({
    this.items = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory AddPagesModel.fromMap(Map<String, dynamic> map) {
    return AddPagesModel(
      items: map['items'] != null
          ? List<AddPagesModelItem>.from(
              (map['items'] as List).map<AddPagesModelItem>(
                (x) => AddPagesModelItem.fromMap(x),
              ),
            )
          : const [],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPagesModel.fromJson(String source) =>
      AddPagesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AddPagesModelItem {
  final num id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String createdAt;

  AddPagesModelItem({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.category = '',
    this.status = '',
    this.createdAt = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory AddPagesModelItem.fromMap(Map<String, dynamic> map) {
    return AddPagesModelItem(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
