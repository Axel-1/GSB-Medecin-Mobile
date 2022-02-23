import 'package:dio/dio.dart';
import 'package:gsb_medecin/model/medecin.dart';

class MedecinsApi {
  late Response response;
  Dio dio = Dio();

  Future<List<Medecin>> getMedecins() async {
    response = await dio.get("http://192.168.1.16:8000/api/medecins",
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    var jsonList = response.data as List;
    var medecinList = jsonList.map(
            (jsonElement) {
          return Medecin.fromJson(jsonElement);
        }
    ).toList();
    return medecinList;
  }

  Future<Medecin> getMedecin(int id) async {
    response = await dio.get("http://192.168.1.16:8000/api/medecins/"+id.toString(),
        options: Options(headers: {Headers.acceptHeader: "application/json"}));
    return Medecin.fromJson(response.data);
  }
}