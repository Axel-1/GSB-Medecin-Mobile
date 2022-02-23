// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medecin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medecin _$MedecinFromJson(Map<String, dynamic> json) => Medecin(
      json['id'] as int,
      json['nom'] as String,
      json['prenom'] as String,
      json['adresse'] as String,
      json['tel'] as String,
    );

Map<String, dynamic> _$MedecinToJson(Medecin instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'adresse': instance.adresse,
      'tel': instance.tel,
    };
