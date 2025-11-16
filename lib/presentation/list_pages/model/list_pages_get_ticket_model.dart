// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListPagesGetTicketModel {
  final List<ListPagesGetTicketModelItem> items;

  ListPagesGetTicketModel({
    this.items = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory ListPagesGetTicketModel.fromMap(Map<String, dynamic> map) {
    return ListPagesGetTicketModel(
      items: map['items'] != null
          ? List<ListPagesGetTicketModelItem>.from(
              (map['items'] as List).map<ListPagesGetTicketModelItem>(
                (x) => ListPagesGetTicketModelItem.fromMap(x),
              ),
            )
          : const [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ListPagesGetTicketModel.fromJson(String source) =>
      ListPagesGetTicketModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class ListPagesGetTicketModelItem {
  final num id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String createdAt;

  ListPagesGetTicketModelItem({
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

  factory ListPagesGetTicketModelItem.fromMap(Map<String, dynamic> map) {
    return ListPagesGetTicketModelItem(
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
