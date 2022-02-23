import 'package:json_annotation/json_annotation.dart';

part 'medecin.g.dart';

@JsonSerializable()
class Medecin {
  Medecin(this.id, this.nom, this.prenom, this.adresse, this.tel);

  int id;
  String nom;
  String prenom;
  String adresse;
  String tel;

  factory Medecin.fromJson(Map<String, dynamic> json) => _$MedecinFromJson(json);

  Map<String, dynamic> toJson() => _$MedecinToJson(this);
}