class Apply {
  final int travellerId;
  final int journeyId;
  final int guideId;
  final String status;

  Apply({
    required this.travellerId,
    required this.journeyId,
    required this.guideId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'travellerId': travellerId,
      'journeyId': journeyId,
      'guideId': guideId,
      'status': status,
    };
  }
}
