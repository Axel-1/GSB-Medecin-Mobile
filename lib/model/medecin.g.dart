// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medecin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medecin _$MedecinFromJson(Map<String, dynamic> json) => Medecin(
      id: json['id'] as int,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      specialiteComplementaire: json['specialiteComplementaire'] == null
          ? null
          : SpecialiteComplementaire.fromJson(
              json['specialiteComplementaire'] as Map<String, dynamic>),
      departement: json['departement'] == null
          ? null
          : Departement.fromJson(json['departement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedecinToJson(Medecin instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'adresse': instance.adresse,
      'tel': instance.tel,
      'specialiteComplementaire': instance.specialiteComplementaire,
      'departement': instance.departement,
    };
