import 'package:trace_expanses/model/category.dart';
import 'baseRepository.dart';
import 'package:trace_expanses/mapper/categoryMapper.dart';

class CategoryRepository extends BaseSqlRepository {

  String _table = "CATEGORY";
  String _title = "title";
  String _id = "id";

  CategoryRepository(){
    connectDb();
  }
 

  Future<List<Map<String, dynamic>>> findAll() async{
    return await database.rawQuery("SELECT * FROM $_table");
  }

  Future<Map<String, dynamic>> findById(int id) async {
    return (await database.rawQuery("SELECT * FROM $_table WHERE $_id=$id")).single;
  } 

  Future<Map<String, dynamic>> findByTitle(String title) async {
    return (await database.rawQuery("SELECT * FROM $_table WHERE $_title=$title")).single;
  }



  Future<void> save(Category model) async{
    await database.insert(_table, model.toMap());
  }
  
}