import 'package:json_annotation/json_annotation.dart';

part 'specialite_complementaire.g.dart';

@JsonSerializable()
class SpecialiteComplementaire {
  SpecialiteComplementaire(this.id, this.libelle);

  int id;
  String libelle;

  factory SpecialiteComplementaire.fromJson(Map<String, dynamic> json) => _$SpecialiteComplementaireFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialiteComplementaireToJson(this);
}