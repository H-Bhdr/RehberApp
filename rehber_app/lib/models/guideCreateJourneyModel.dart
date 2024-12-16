class GuideCreateJourneyModel {
  int guideId;
  String destination;
  String description;
  String startDate;
  String endDate;

  GuideCreateJourneyModel({
    required this.guideId,
    required this.destination,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'guideId': guideId,
      'destination': destination,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
