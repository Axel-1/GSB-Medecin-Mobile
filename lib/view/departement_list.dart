import 'package:flutter/material.dart';
import 'package:gsb_medecin/model/departement.dart';
import 'package:gsb_medecin/service/medecins_api.dart';
import 'package:gsb_medecin/view/medecin_list.dart';

import '../model/medecin.dart';

class DepartementList extends StatefulWidget {
  const DepartementList({Key? key}) : super(key: key);

  static const routeName = '/departementList';

  @override
  State<DepartementList> createState() => _DepartementListState();
}

class _DepartementListState extends State<DepartementList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Future<List<Departement>>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Départements"),
        ),
        body: Center(
          child: FutureBuilder<List<Departement>>(
            future: args,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(snapshot.data![i].nom),
                        ],
                      ),
                      leading: const Icon(Icons.place),
                      onTap: () {
                        Future<List<Medecin>> medecins = MedecinsApi()
                            .getMedecinsByDepartement(snapshot.data![i]);
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
