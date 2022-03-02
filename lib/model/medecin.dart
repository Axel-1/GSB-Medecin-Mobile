import 'package:gsb_medecin/model/departement.dart';
import 'package:gsb_medecin/model/specialite_complementaire.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medecin.g.dart';

@JsonSerializable()
class Medecin {
  int id;
  String? nom;
  String? prenom;
  String? adresse;
  String? tel;
  SpecialiteComplementaire? specialiteComplementaire;
  Departement? departement;

  Medecin({required this.id, this.nom, this.prenom, this.adresse, this.tel, this.specialiteComplementaire, this.departement});

  factory Medecin.fromJson(Map<String, dynamic> json) =>
      _$MedecinFromJson(json);

  Map<String, dynamic> toJson() => _$MedecinToJson(this);
}
