import 'package:gsb_medecin/model/medecin.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departement.g.dart';

@JsonSerializable()
class Departement {
  int id;
  String nom;
  List<Medecin>? medecins;

  Departement({required this.id, required this.nom, this.medecins});

  factory Departement.fromJson(Map<String, dynamic> json) =>
      _$DepartementFromJson(json);

  Map<String, dynamic> toJson() => _$DepartementToJson(this);
}
