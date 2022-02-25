import 'package:json_annotation/json_annotation.dart';

part 'pays.g.dart';

@JsonSerializable()
class Pays {
  Pays(this.id, this.nom);

  int id;
  String nom;

  factory Pays.fromJson(Map<String, dynamic> json) => _$PaysFromJson(json);

  Map<String, dynamic> toJson() => _$PaysToJson(this);
}