class Tasks {
  final int id;
  final String description;
  final bool isArchived;
  final bool isCompleted;
  final int collectionId;

  Tasks({
    this.id = 0,
    this.description = '',
    this.isArchived = false,
    this.isCompleted = false,
    this.collectionId = 0,
  });

  Tasks copyWith({
    int? id,
    String? description,
    bool? isArchived,
    bool? isCompleted,
    int? collectionId,
  }) =>
      Tasks(
        id: id ?? this.id,
        description: description ?? this.description,
        isArchived: isArchived ?? this.isArchived,
        isCompleted: isCompleted ?? this.isCompleted,
        collectionId: collectionId ?? this.collectionId,
      );
}
