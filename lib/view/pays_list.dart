import 'package:flutter/material.dart';
import 'package:gsb_medecin/model/departement.dart';
import 'package:gsb_medecin/service/medecins_api.dart';
import 'package:gsb_medecin/view/departement_list.dart';

import '../model/pays.dart';

class PaysList extends StatefulWidget {
  const PaysList({Key? key}) : super(key: key);

  @override
  State<PaysList> createState() => _PaysListState();
}

class _PaysListState extends State<PaysList> {
  Future<List<Pays>> _future = MedecinsApi().getPaysList();

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
          title: const Text("Pays"),
        ),
        body: Center(
      child: FutureBuilder<List<Pays>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ElevatedButton(
                onPressed: () {
                  _future = MedecinsApi().getPaysList();
                  setState(() {});
                },
                child: const Text("Réessayer"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(snapshot.data![i].nom),
                    ],
                  ),
                  leading: const Icon(Icons.south_america_rounded),
                  onTap: () {
                    Future<List<Departement>> departements =
                        MedecinsApi().getDepartementsByPays(snapshot.data![i]);
                    Navigator.pushNamed(context, DepartementList.routeName,
                        arguments: departements);
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
