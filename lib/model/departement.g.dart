// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Departement _$DepartementFromJson(Map<String, dynamic> json) => Departement(
      id: json['id'] as int,
      nom: json['nom'] as String,
      medecins: (json['medecins'] as List<dynamic>?)
          ?.map((e) => Medecin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartementToJson(Departement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'medecins': instance.medecins,
    };
