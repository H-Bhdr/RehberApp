class Match {
  final int id;
  final int guideId;
  final int travellerId;
  final int journeyId;
  final String status;

  Match({
    required this.id,
    required this.guideId,
    required this.travellerId,
    required this.journeyId,
    required this.status,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      guideId: json['guideId'],
      travellerId: json['travellerId'],
      journeyId: json['journeyId'],
      status: json['status'],
    );
  }
}
