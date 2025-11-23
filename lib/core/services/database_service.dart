abstract class DatabaseService {
  Future<void> addData({required String collectionPath, required Map<String, dynamic> data});
}