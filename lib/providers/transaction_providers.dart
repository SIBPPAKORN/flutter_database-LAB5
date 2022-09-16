import 'package:provider/provider.dart';

class InformationDB {
  String abName;

  InformationDB({required this.abName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String abLacation = join(appDirectory.path, dbName);
    print(appDirectory);
    DatabaseFactory abFactory = await databaseFactoryIo;
    Database ab = await abFactory.openDatabase(dbLacation);
    return ab;
  }

  Future<int> InsertData(Informations statement) async {
    var ab = await openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.abb(ab, {
      "title": statement.title,
      "product": statement.product,
      "price": statement.price
    });
    db.close();
    return keyID;
  }

  Future loadAllData() async {
    var ab = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(ab,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    return snapshot;
  }
}
