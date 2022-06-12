import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final _nameController = TextEditingController();
  final _powerController = TextEditingController();

  final CollectionReference heroes =
      FirebaseFirestore.instance.collection('superheroes');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: heroes.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, idx) {
                  final DocumentSnapshot docSnap =
                      streamSnapshot.data!.docs[idx];
                  return Card(
                    margin: const EdgeInsets.all(20),
                    child: ListTile(
                      leading: Text((idx + 1).toString()),
                      title: Text(docSnap['name']),
                      subtitle: Text(docSnap['power'].toString()),
                      trailing: Column(
                        children: [
                          Flexible(
                            child: IconButton(
                                onPressed: () {
                                  bottomSheet(context, docSnap);
                                },
                                icon: const Icon(Icons.edit)),
                          ),
                          Flexible(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }

  Future<void> bottomSheet(context,
      [DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _powerController.text = documentSnapshot['power'].toString();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          height: 300,
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Launch a new Hero'),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: false),
                  controller: _powerController,
                  decoration: const InputDecoration(labelText: 'Power'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? power =
                        double.tryParse(_powerController.text);

                    if (power != null) {
                      await heroes
                          .doc(documentSnapshot!.id)
                          .update({'name': name, 'power': power});
                      _nameController.text = '';
                      _powerController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent.shade700,
                  ),
                  child: const Text('Add to Database'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
