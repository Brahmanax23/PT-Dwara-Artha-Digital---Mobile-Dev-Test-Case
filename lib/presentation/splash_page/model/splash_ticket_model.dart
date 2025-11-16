// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SplashTicketModel {
  final List<SplashTicketModelItem> items;

  SplashTicketModel({
    this.items = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory SplashTicketModel.fromMap(Map<String, dynamic> map) {
    return SplashTicketModel(
      items: map['items'] != null
          ? List<SplashTicketModelItem>.from(
              (map['items'] as List).map<SplashTicketModelItem>(
                (x) => SplashTicketModelItem.fromMap(x),
              ),
            )
          : const [],
    );
  }

  String toJson() => json.encode(toMap());

  factory SplashTicketModel.fromJson(String source) =>
      SplashTicketModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SplashTicketModelItem {
  final num id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String createdAt;

  SplashTicketModelItem({
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

  factory SplashTicketModelItem.fromMap(Map<String, dynamic> map) {
    return SplashTicketModelItem(
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
