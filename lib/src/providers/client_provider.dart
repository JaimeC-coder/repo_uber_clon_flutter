import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber/src/pages/models/client.dart';

class ClientProvider {
  CollectionReference? _ref;

  ClientProvider() {
    _ref = FirebaseFirestore.instance.collection('Clients');
  }
  Future<void> create(Client client) async {
    String errorMessage = '';
    try {

      await _ref!.doc(client.id).set(client.toJson());
    } catch (e) {
      errorMessage = e.hashCode.toString();
      print('Error: $e');
    }
    if (errorMessage != '') {
      return Future.error(errorMessage);
    }
  }
}
