import 'package:provider/provider.dart';

class InformationDB {
  String dbName;

  InformationDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLacation = join(appDirectory.path, dbName);
    print(appDirectory);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLacation);
    return db;
  }

  Future<int> InsertData(Informations statement) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "product": statement.product,
      "price": statement.price
    });
    db.close();
    return keyID;
  }

  Future loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    return snapshot;
  }
}
