import '../../../database/app_database.dart';

class CollectionModel {
  const CollectionModel({
    required this.id,
    required this.name,
    this.description,
    required this.colorLabel,
    required this.createdAt,
    required this.updatedAt,
    required this.sortOrder,
    this.requestCount = 0,
  });

  final String id;
  final String name;
  final String? description;
  final String colorLabel;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;
  final int requestCount;

  factory CollectionModel.fromRow(Collection row, {int requestCount = 0}) {
    return CollectionModel(
      id: row.id,
      name: row.name,
      description: row.description,
      colorLabel: row.colorLabel,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      sortOrder: row.sortOrder,
      requestCount: requestCount,
    );
  }
}
