import 'package:dio/dio.dart';
import 'package:gsb_medecin/model/departement.dart';
import 'package:gsb_medecin/model/medecin.dart';

import '../model/pays.dart';

class MedecinsApi {
  late Response response;
  Dio dio = Dio();

  Future<List<Medecin>> getMedecins() async {
    try {
      response = await dio.get("http://192.168.1.16:8000/api/medecins",
          options: Options(
              headers: {Headers.acceptHeader: "application/json"}));
      var jsonList = response.data as List;
      var medecinList = jsonList.map(
              (jsonElement) {
            return Medecin.fromJson(jsonElement);
          }
      ).toList();
      return medecinList;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Medecin> getMedecin(int id) async {
    response = await dio.get("http://192.168.1.16:8000/api/medecins/"+id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Medecin.fromJson(response.data);
  }

  Future<List<Pays>> getPaysList() async {
    response = await dio.get("http://192.168.1.16:8000/api/pays",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var paysList = jsonList.map(
            (jsonElement) {
          return Pays.fromJson(jsonElement);
        }
    ).toList();
    return paysList;
  }

  Future<Pays> getPays(int id) async {
    response = await dio.get("http://192.168.1.16:8000/api/pays/"+id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Pays.fromJson(response.data);
  }

  Future<List<Departement>> getDepartements() async {
    response = await dio.get("http://192.168.1.16:8000/api/departements",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var departementList = jsonList.map(
            (jsonElement) {
          return Departement.fromJson(jsonElement);
        }
    ).toList();
    return departementList;
  }

  Future<Departement> getDepartement(int id) async {
    response = await dio.get("http://192.168.1.16:8000/api/medecins/"+id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Departement.fromJson(response.data);
  }
}