import 'package:injectable/injectable.dart';

const defaultRequestDurationMillis = 2000;

@singleton
class LoginServiceApi{

  Future<String> login() async{
    await Future.delayed(
      const Duration(milliseconds: defaultRequestDurationMillis),
    );
    return 'hyDFsbfahjsfbjah322kjdfnkjn234e2jnd';
  }
}