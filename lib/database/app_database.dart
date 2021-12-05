import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      return db.execute(ContactDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete, // fresh database when downgrade migration version
  );
  return database;
}
