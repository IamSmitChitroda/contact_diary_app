import 'package:countact_diary_app/headers.dart';

class ContactController extends ChangeNotifier {
  ContactController({
    required this.sp,
    required this.name,
    required this.number,
    required this.email,
  }) {
    valueAssign();
  }

  late SharedPreferences sp;
  late List<String> name;
  late List<String> number;
  late List<String> email;

  List<Contacts> allContacts = [];
  List<Contacts> favoriteContacts = [];
  List<Contacts> hideContacts = [];

  void valueAssign() {
    for (int i = 0; i < name.length; i++) {
      allContacts.add(Contacts(
          name: name[i], number: number[i], email: email[i], photo: ' '));
    }
    notifyListeners();
  }

  Future<void> addContact({required Contacts contact}) async {
    allContacts.add(contact);
    await sp.setStringList('name', allContacts.map((e) => e.name).toList());
    await sp.setStringList('number', allContacts.map((e) => e.number).toList());
    await sp.setStringList('email', allContacts.map((e) => e.email).toList());
    notifyListeners();
  }

  void removeContact({required Contacts contact}) {
    allContacts.remove(contact);
    notifyListeners();
  }

  void editContact({required int index, required Contacts contact}) {
    allContacts[index] = contact;
    notifyListeners();
  }

  void addInFavoriteContact({required int index}) {
    favoriteContacts.add(allContacts[index]);
    notifyListeners();
  }

  void removeFromFavoriteContact({required int index}) {
    favoriteContacts.removeAt(index);
    notifyListeners();
  }

  void addInHideContact({required int index}) {
    allContacts.removeAt(index);
    notifyListeners();
  }

  void removeFromHideContact({required int index}) {
    hideContacts.add(allContacts[index]);
    notifyListeners();
  }
}
