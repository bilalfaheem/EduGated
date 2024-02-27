import 'package:edugated/domain/entities/response_body.dart';
import 'package:edugated/domain/failures/scan_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ScanRepository {
  Future<Either<ScanFailure, ResponseBody>> scan(Map<String, dynamic> data);
}
