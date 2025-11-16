// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DetailPagesModel {
  final List<DetailPagesModelItem> items;

  DetailPagesModel({
    this.items = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory DetailPagesModel.fromMap(Map<String, dynamic> map) {
    return DetailPagesModel(
      items: map['items'] != null
          ? List<DetailPagesModelItem>.from(
              (map['items'] as List).map<DetailPagesModelItem>(
                (x) => DetailPagesModelItem.fromMap(x),
              ),
            )
          : const [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailPagesModel.fromJson(String source) =>
      DetailPagesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DetailPagesModelItem {
  final num id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String createdAt;

  DetailPagesModelItem({
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

  factory DetailPagesModelItem.fromMap(Map<String, dynamic> map) {
    return DetailPagesModelItem(
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
