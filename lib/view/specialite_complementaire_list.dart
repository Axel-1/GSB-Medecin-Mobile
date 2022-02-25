import 'package:flutter/material.dart';
import 'package:gsb_medecin/service/medecins_api.dart';
import 'package:gsb_medecin/view/medecin_list.dart';

import '../model/medecin.dart';
import '../model/specialite_complementaire.dart';

class SpecialiteComplementaireList extends StatefulWidget {
  const SpecialiteComplementaireList({Key? key}) : super(key: key);

  @override
  State<SpecialiteComplementaireList> createState() =>
      _SpecialiteComplementaireListState();
}

class _SpecialiteComplementaireListState
    extends State<SpecialiteComplementaireList> {
  Future<List<SpecialiteComplementaire>> _future =
      MedecinsApi().getSpecialiteComplementaires();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text("Spécialités complémentaires"),
        ),
        body: Center(
      child: FutureBuilder<List<SpecialiteComplementaire>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ElevatedButton(
                onPressed: () {
                  _future = MedecinsApi().getSpecialiteComplementaires();
                  setState(() {});
                },
                child: const Text("Réessayer"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(snapshot.data![i].libelle),
                    ],
                  ),
                  leading: const Icon(Icons.format_list_bulleted),
                  onTap: () {
                    Future<List<Medecin>> medecins = MedecinsApi()
                        .getMedecinsBySpecialiteComplementaire(
                            snapshot.data![i]);
                    Navigator.pushNamed(context, MedecinList.routeName,
                        arguments: medecins);
                  },
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
  }
}
