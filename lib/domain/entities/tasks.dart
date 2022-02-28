class Tasks {
  final int id;
  final String description;
  final bool isArchived;
  final bool isCompleted;
  final String collectionName;

  Tasks({
    this.id = 0,
    this.description = '',
    this.isArchived = false,
    this.isCompleted = false,
    this.collectionName = '',
  });

  Tasks copyWith({
    int? id,
    String? description,
    bool? isArchived,
    bool? isCompleted,
    String? collectionName,
  }) =>
      Tasks(
        id: id ?? this.id,
        description: description ?? this.description,
        isArchived: isArchived ?? this.isArchived,
        isCompleted: isCompleted ?? this.isCompleted,
        collectionName: collectionName ?? this.collectionName,
      );
}
