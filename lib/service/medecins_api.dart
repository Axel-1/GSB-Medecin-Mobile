import 'package:dio/dio.dart';
import 'package:gsb_medecin/model/departement.dart';
import 'package:gsb_medecin/model/medecin.dart';
import 'package:gsb_medecin/model/specialite_complementaire.dart';

import '../model/pays.dart';

class MedecinsApi {
  late Response response;
  Dio dio = Dio();

  Future<List<Medecin>> getMedecins() async {
    response = await dio.get("http://192.168.1.16:8000/api/medecins",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var medecinList = jsonList.map((jsonElement) {
      return Medecin.fromJson(jsonElement);
    }).toList();
    return medecinList;
  }

  Future<Medecin> getMedecin(int id) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/medecins/" + id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Medecin.fromJson(response.data);
  }

  Future<List<Pays>> getPaysList() async {
    response = await dio.get("http://192.168.1.16:8000/api/pays",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var paysList = jsonList.map((jsonElement) {
      return Pays.fromJson(jsonElement);
    }).toList();
    return paysList;
  }

  Future<Pays> getPays(int id) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/pays/" + id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Pays.fromJson(response.data);
  }

  Future<List<Departement>> getDepartements() async {
    response = await dio.get("http://192.168.1.16:8000/api/departements",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var departementList = jsonList.map((jsonElement) {
      return Departement.fromJson(jsonElement);
    }).toList();
    return departementList;
  }

  Future<List<Departement>> getDepartementsByPays(Pays pays) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/pays/" + pays.id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    List<Departement> departements = [];
    Pays paysFromAPI = Pays.fromJson(response.data);
    if (paysFromAPI.departements != null) {
      departements.addAll(paysFromAPI.departements!);
    }
    return departements;
  }

  Future<Departement> getDepartement(int id) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/medecins/" + id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Departement.fromJson(response.data);
  }

  Future<List<Medecin>> getMedecinsByDepartement(
      Departement departement) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/departements/" +
            departement.id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    List<Medecin> medecins = [];
    Departement departementFromAPI = Departement.fromJson(response.data);
    if (departementFromAPI.medecins != null) {
      medecins.addAll(departementFromAPI.medecins!);
    }
    return medecins;
  }

  Future<List<SpecialiteComplementaire>> getSpecialiteComplementaires() async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/specialite_complementaires",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var specialiteComplementairesList = jsonList.map((jsonElement) {
      return SpecialiteComplementaire.fromJson(jsonElement);
    }).toList();
    return specialiteComplementairesList;
  }

  Future<List<Medecin>> getMedecinsBySpecialiteComplementaire(
      SpecialiteComplementaire spe) async {
    response = await dio.get(
        "http://192.168.1.16:8000/api/specialite_complementaires/" +
            spe.id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    List<Medecin> medecins = [];
    SpecialiteComplementaire speFromAPI =
        SpecialiteComplementaire.fromJson(response.data);
    if (speFromAPI.medecins != null) {
      medecins.addAll(speFromAPI.medecins!);
    }
    return medecins;
  }
}
