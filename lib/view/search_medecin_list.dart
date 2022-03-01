import 'package:flutter/material.dart';
import 'package:gsb_medecin/model/medecin.dart';
import 'package:gsb_medecin/service/medecins_api.dart';
import 'package:gsb_medecin/service/search_medecin.dart';

import 'medecin_details.dart';

class SearchMedecinList extends StatefulWidget {
  const SearchMedecinList({Key? key}) : super(key: key);

  @override
  State<SearchMedecinList> createState() => _SearchMedecinListState();
}

class _SearchMedecinListState extends State<SearchMedecinList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Médecins"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchMedecin(hintText: "Rechercher par nom..."));
                },
                icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Center(
          child: FutureBuilder<List<Medecin>>(
            future: MedecinsApi().getMedecins(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(snapshot.data![i].prenom!),
                          const Text(" "),
                          Text(snapshot.data![i].nom!)
                        ],
                      ),
                      subtitle: Text(snapshot.data![i].adresse!),
                      leading: const Icon(Icons.account_circle),
                      onTap: () {
                        Navigator.pushNamed(context, MedecinDetails.routeName,
                            arguments: snapshot.data![i].id);
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
