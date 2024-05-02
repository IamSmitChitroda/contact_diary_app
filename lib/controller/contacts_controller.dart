import 'package:countact_diary_app/headers.dart';

class ContactController extends ChangeNotifier {
  List<Contacts> savedContacts = [];
  // List<Contacts> favoriteContacts = [];
  // List<Contacts> hideContacts = [];

  void addContact({required Contacts contact}) {
    savedContacts.add(contact);
    notifyListeners();
  }

  void removeContact({required Contacts contact}) {
    savedContacts.remove(contact);
    notifyListeners();
  }

  void editContact({required int index, required Contacts contact}) {
    savedContacts[index] = contact;
    notifyListeners();
  }

  // void addInFavoriteContact({required int index}) {
  //   favoriteContacts.add(savedContacts[index]);
  //   notifyListeners();
  // }
  //
  // void removeFromFavoriteContact({required int index}) {
  //   favoriteContacts.removeAt(index);
  //   notifyListeners();
  // }
  //
  // void addInHideContact({required int index}) {
  //   savedContacts.removeAt(index);
  //   notifyListeners();
  // }
  //
  // void removeFromHideContact({required int index}) {
  //   hideContacts.add(savedContacts[index]);
  //   notifyListeners();
  // }
}
