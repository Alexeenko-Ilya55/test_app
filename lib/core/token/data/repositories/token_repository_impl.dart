import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl extends TokenRepository {
  String? _token;
  final StreamController<String?> _tokenUpdatesController = StreamController();

  @override
  bool get isAuthorized => _token != null;

  @override
  Stream<String?> get tokenUpdates => _tokenUpdatesController.stream;

  @override
  Future<String?> getToken() async => Future.value(_token);

  @override
  Future<bool> setToken(String newToken) async {
    _token = newToken;
    _tokenUpdatesController.sink.add(_token);
    return Future.value(true);
  }

  @override
  Future<bool> removeToken() {
    _token = null;
    _tokenUpdatesController.sink.add(null);
    return Future.value(true);
  }
}