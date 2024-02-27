import 'package:edugated/domain/entities/pass.dart';

class PassDetailInitialParams {
  final bool valid;
  final Pass? pass;
  final String? error;
  PassDetailInitialParams({this.error, required this.valid, this.pass});
}
