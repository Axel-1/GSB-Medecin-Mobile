import 'package:flutter/material.dart';

import '../model/medecin.dart';
import '../view/medecin_details.dart';
import 'medecins_api.dart';

class SearchMedecin extends SearchDelegate {
  SearchMedecin({
    required String hintText,
  }) : super(
    searchFieldLabel: hintText,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Medecin>>(
      future: MedecinsApi().getMedecins(query: query),
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
          return const Center(child : CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text("Appuyer sur entrée pour rechercher..."),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}
