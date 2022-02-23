import 'package:flutter/material.dart';
import 'package:gsb_medecin/model/medecin.dart';
import 'package:gsb_medecin/service/medecins_api.dart';

class MedecinList extends StatefulWidget {
  const MedecinList({Key? key}) : super(key: key);

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
    return MaterialApp(
      title: 'Médecins',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Médecins'),
          ),
          body: Center(
            child: FutureBuilder<List<Medecin>>(
              future: MedecinsApi().getMedecins(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Row(
                          children: [
                            Text(snapshot.data![i].prenom),
                            Text(" "),
                            Text(snapshot.data![i].nom)
                          ],
                        ),
                        subtitle: Text(snapshot.data![i].adresse),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          )),
    );
  }
}
