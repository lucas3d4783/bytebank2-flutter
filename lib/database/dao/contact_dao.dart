import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';

class ContactDao {
  static const tableSql = "CREATE TABLE $_tableName("
      "$_id INTEGER PRIMARY KEY,"
      "$_name TEXT,"
      "$_accountNumber INTEGER)";
  static const _tableName = 'contacts';
  static const _id = 'id';
  static const _name = 'name';
  static const _accountNumber = 'account_number';

  Future<int> save(Contact contact) {
    return createDatabase().then((db) async {
      Map<String, dynamic> contactMap = _toMap(contact);
      return await db.insert(_tableName, contactMap);
    });
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() {
    return createDatabase().then((db) {
      return db.query(_tableName).then((result) {
        return _toList(result);
      });
    });
  }

  List<Contact> _toList(List<Map<String, Object?>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final contact = Contact(row[_id], row[_name], row[_accountNumber]);
      contacts.add(contact);
    }
    return contacts;
  }
}
