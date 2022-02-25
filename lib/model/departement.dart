import 'package:json_annotation/json_annotation.dart';

part 'departement.g.dart';

@JsonSerializable()
class Departement {
  Departement(this.id, this.nom);

  int id;
  String nom;

  factory Departement.fromJson(Map<String, dynamic> json) => _$DepartementFromJson(json);

  Map<String, dynamic> toJson() => _$DepartementToJson(this);
}