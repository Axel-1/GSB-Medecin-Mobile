import 'package:flutter/material.dart';
import 'package:gsb_medecin/service/medecins_api.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder<Medecin>(
          future: MedecinsApi().getMedecin(args),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const Icon(Icons.account_circle, size: 150),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(snapshot.data!.prenom!,
                            style: const TextStyle(fontSize: 30)),
                        const Text(" ", style: TextStyle(fontSize: 30)),
                        Text(snapshot.data!.nom!,
                            style: const TextStyle(fontSize: 30))
                      ],
                    ),
                  )
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
