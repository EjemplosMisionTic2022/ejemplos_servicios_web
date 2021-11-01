class AnimalModel {
  String name, description, sex, breed;

  AnimalModel(
      {required this.name,
      required this.description,
      required this.sex,
      required this.breed});

  factory AnimalModel.fromJson(Map<String, dynamic> map) {
    return AnimalModel(
        name: map['attributes']['name'],
        description: map['attributes']['descriptionText'],
        sex: map['attributes']['sex'],
        breed: map['attributes']['breedString']);
  }
}
