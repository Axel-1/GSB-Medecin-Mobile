import 'package:flutter/material.dart';
import 'package:gsb_medecin/model/medecin.dart';

import 'medecin_details.dart';

class MedecinList extends StatefulWidget {
  const MedecinList({Key? key}) : super(key: key);

  static const routeName = '/medecinList';

  @override
  State<MedecinList> createState() => _MedecinListState();
}

class _MedecinListState extends State<MedecinList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Future<List<Medecin>>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Médecins"),
        ),
        body: Center(
          child: FutureBuilder<List<Medecin>>(
            future: args,
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
