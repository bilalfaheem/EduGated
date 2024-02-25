import 'package:collection/collection.dart';
import 'package:edugated/domain/entities/pass.dart';

class History {
  String? id;
  String? passDate;
  String? userId;
  String? contactId;
  dynamic qrCode;
  String? scanAt;
  String? scanBy;
  String? createdAt;
  String? updatedAt;
  String? userName;
  String? contactName;

  History({
    this.id,
    this.passDate,
    this.userId,
    this.contactId,
    this.qrCode,
    this.scanAt,
    this.scanBy,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.contactName,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json['id'] as String?,
        passDate: json['pass_date'] as String?,
        userId: json['user_id'] as String?,
        contactId: json['contact_id'] as String?,
        qrCode: json['qr_code'] as dynamic,
        scanAt: json['scan_at'] as String?,
        scanBy: json['scan_by'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        userName: json['user_name'] as String?,
        contactName: json['contact_name'] as String?,
      );

  Pass toDomain() => Pass(
      id: id ?? "",
      passDate: passDate ?? "",
      userId: userId ?? "",
      contactId: contactId ?? "",
      qrCode: qrCode ?? "",
      userName: userName ?? "",
      contactName: contactName ?? "",
      contactPhone: "contactPhone" ?? "",
      contactEmail: "contactEmail" ?? "");
}
