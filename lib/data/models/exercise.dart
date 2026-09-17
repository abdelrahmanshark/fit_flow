class Exercise {
  const Exercise({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.imageUrl,
    required this.equipment,
    required this.muscleGroups,
    required this.formCuesEn,
    required this.formCuesAr,
  });

  final String id;
  final String titleEn;
  final String titleAr;
  final String imageUrl;
  final List<String> equipment;
  final List<String> muscleGroups;
  final List<String> formCuesEn;
  final List<String> formCuesAr;

  String titleForLocale(String languageCode) {
    return languageCode == 'ar' ? titleAr : titleEn;
  }

  List<String> formCuesForLocale(String languageCode) {
    return languageCode == 'ar' ? formCuesAr : formCuesEn;
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    final title = json['title'] as Map<String, dynamic>;
    final formCues = json['form_cues'] as Map<String, dynamic>;

    return Exercise(
      id: json['id'] as String,
      titleEn: title['en'] as String,
      titleAr: title['ar'] as String,
      imageUrl: json['image_url'] as String,
      equipment: (json['equipment'] as List<dynamic>).cast<String>(),
      muscleGroups: (json['muscle_groups'] as List<dynamic>).cast<String>(),
      formCuesEn: (formCues['en'] as List<dynamic>).cast<String>(),
      formCuesAr: (formCues['ar'] as List<dynamic>).cast<String>(),
    );
  }
}
