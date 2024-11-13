import 'package:dio/dio.dart';
import '../models/note.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  Future<List<Gear>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      List<Gear> products = (response.data as List)
          .map((json) => Gear.fromJson(json))
          .toList();
      return products;
    } catch (e) {
      throw Exception('Не удалось загрузить продукты: $e');
    }
  }

  Future<void> createProduct(Gear gear) async {
    try {
      await _dio.post('/products', data: gear.toJson());
    } catch (e) {
      throw Exception('Не удалось создать продукт: $e');
    }
  }

  Future<Gear> getProductByID(int id) async {
    try {
      final response = await _dio.get('/products/$id');
      return Gear.fromJson(response.data);
    } catch (e) {
      throw Exception('Продукт не найден: $e');
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _dio.delete('/products/$id');
    } catch (e) {
      throw Exception('Не удалось удалить продукт: $e');
    }
  }
}