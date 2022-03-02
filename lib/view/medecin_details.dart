import 'package:flutter/material.dart';
import 'package:gsb_medecin/service/medecins_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/medecin.dart';

class MedecinDetails extends StatefulWidget {
  const MedecinDetails({Key? key}) : super(key: key);

  static const routeName = '/medecinDetails';

  @override
  _MedecinDetailsState createState() => _MedecinDetailsState();
}

class _MedecinDetailsState extends State<MedecinDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<Medecin>(
          future: MedecinsApi().getMedecin(args),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  const Icon(Icons.account_circle, size: 150),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(snapshot.data!.prenom!,
                                style: Theme.of(context).textTheme.headline4),
                            const Text(" ", style: TextStyle(fontSize: 30)),
                            Text(snapshot.data!.nom!,
                                style: Theme.of(context).textTheme.headline4)
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            snapshot.data!.specialiteComplementaire != null
                                ? Text(
                                    snapshot.data!.specialiteComplementaire!
                                        .libelle,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                : Text(
                                    "Aucune spécialité complémentaire",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.place_outlined),
                    title: Text(snapshot.data!.adresse!),
                    subtitle: Text(snapshot.data!.departement!.nom+", "+snapshot.data!.departement!.pays!.nom),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: Text(snapshot.data!.tel!),
                    onTap: () {
                      launch('tel:'+snapshot.data!.tel!);
                    },
                  ),
                  const Divider(),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
