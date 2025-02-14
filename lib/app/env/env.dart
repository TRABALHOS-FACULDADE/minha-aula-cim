// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API', obfuscate: true, interpolate: true)
  static String api = _Env.api;
}
