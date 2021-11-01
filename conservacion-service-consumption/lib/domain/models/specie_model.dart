class SpecieModel {
  String kingdomName, className, orderName, familyName, scientificName, taxonomicAuthority;

  SpecieModel(
      {required this.kingdomName,
      required this.className,
      required this.scientificName,
      required this.orderName,
      required this.familyName,
      required this.taxonomicAuthority});

  factory SpecieModel.fromJson(Map<String, dynamic> map) {
    return SpecieModel(
        kingdomName: map['kingdom_name'],
        className: map['class_name'],
        scientificName: map['scientific_name'],
        orderName: map['order_name'],
        familyName: map['family_name'],
        taxonomicAuthority: map['taxonomic_authority']);
  }
}
