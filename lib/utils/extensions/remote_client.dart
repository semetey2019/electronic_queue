import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:electronic_queue/utils/extensions/auth_exception.dart';
import 'package:electronic_queue/utils/extensions/convert_exception.dart';
import 'package:electronic_queue/utils/extensions/network_exception.dart';
import 'package:electronic_queue/utils/extensions/server_exception.dart';
import 'package:http/http.dart';

import 'network_client.dart';

class RemoteClient {
  const RemoteClient(Client client, {required this.networkClient})
      : _client = client;

  final Client _client;
  final NetworkClient networkClient;

  /// Получение токена и возврат заголовка
  Map<String, String> getHeader(String? token) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) headers['Authorization'] = 'Bearer $token';

    return headers;
  }

  //Работа с ответом
  Future<Either<Exception, T>> responseType<T>(
    Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    // в случае успешного ответа вернуть данные изJson
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final model =
            fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return Right(model);
      } catch (e) {
        return Left(ConvertExc(message: '$e'));
      }

      //если возвращается исключение Unauthorized Authentication Exception
    } else if (response.statusCode == 401) {
      return const Left(AuthenticationException());
    } else {
      // если ответ не является успешным и неавторизованным, то будет возвращено исключение сервера
      return const Left(ServerExc('server exception'));
    }
  }

  // Получение данных в формате Json
  Future<Either<Exception, T>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    String? token,
    required Map<String, dynamic> body,
  }) async {
    try {
      final header = getHeader(token);
      if (await networkClient.checkInternetConnection()) {
        final response = await _client.get(
          Uri.parse(path),
          headers: header,
        );
        return responseType<T>(response, fromJson);
      } else {
        return const Left(NetworkExc());
      }
    } catch (e) {
      log(e.toString());
      return const Left(ServerExc(null));
    }
  }

  //Выполнить запрос методом "POST" с использованием типа содержимого JSON
  Future<Response?> post<T>(
    String path, {
    T Function(Map<String, dynamic>)? fromJson,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final header = getHeader(token);
      // if (await networkClient.checkInternetConnection()) {
      final response = await _client.post(
        Uri.parse(path),
        headers: header,
        body: jsonEncode(body),
      );
      return response;
      // return responseType<T>(response, fromJson);
      // } else {
      //   const Left(NetworkExc());
      // }
    } catch (e) {
      log(e.toString());
      const Left(ServerExc(null));
    }
    return null;
  }

  // Выполнить запрос методом "PATCH" с использованием типа содержимого JSON
  Future<Either<Exception, T>> patch<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    final header = getHeader(token);
    if (await networkClient.checkInternetConnection()) {
      final response = await _client.patch(
        Uri.parse(path),
        body: jsonEncode(body),
        headers: header,
      );
      return responseType<T>(response, fromJson);
    } else {
      return const Left(NetworkExc());
    }
  }

  //Выполнить запрос методом "PUT" с использованием типа содержимого JSON
  Future<Either<Exception, T>> put<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    final header = getHeader(token);
    if (await networkClient.checkInternetConnection()) {
      final response = await _client.put(
        Uri.parse(path),
        body: jsonEncode(body),
        headers: header,
      );
      return responseType<T>(response, fromJson);
    } else {
      return const Left(NetworkExc());
    }
  }

  //Выполнить запрос методом "DELETE" с использованием типа содержимого JSON
  Future<Either<Exception, T>> delete<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    final header = getHeader(token);
    if (await networkClient.checkInternetConnection()) {
      final response = await _client.delete(
        Uri.parse(path),
        body: jsonEncode(body),
        headers: header,
      );
      return responseType<T>(response, fromJson);
    } else {
      return const Left(NetworkExc());
    }
  }
}
