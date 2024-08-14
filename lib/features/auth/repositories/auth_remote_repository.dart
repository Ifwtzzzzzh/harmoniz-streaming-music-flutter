import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:harmoniz/features/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/failure/failure.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/auth/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      return Right(
        UserModel(
          name: name,
          email: email,
          id: resBodyMap['id'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
