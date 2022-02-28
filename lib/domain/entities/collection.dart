class Collection {
  final int id;

  final String collectionName;

  Collection({
    this.id = 0,
    this.collectionName = '',
  });

  Collection copyWith({
    int? id,
    String? collectionName,
  }) =>
      Collection(
        id: id ?? this.id,
        collectionName: collectionName ?? this.collectionName,
      );
}
