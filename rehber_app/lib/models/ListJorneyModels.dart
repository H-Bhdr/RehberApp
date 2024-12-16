class Journey {
  final int id;
  final String destination;
  final String startDate;
  final String endDate;
  final String description;
  final String guideId;
  final List<dynamic> matchIds;

  Journey({
    required this.id,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.guideId,
    required this.matchIds,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['id'],
      destination: json['destination'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      guideId: json['guideId'],
      matchIds: json['matchIds'],
    );
  }
}
