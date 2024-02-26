import 'package:edugated/domain/entities/pass.dart';

class Active {
  String? id;
  String? passDate;
  String? userId;
  dynamic contactId;
  String? qrCode;
  dynamic scanAt;
  dynamic scanBy;
  String? createdAt;
  String? updatedAt;
  String? userName;
  dynamic contactName;
  String? contactPhone;
  String? contactEmail;
  String? contactType;

  Active(
      {this.id,
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
      this.contactPhone,
      this.contactEmail,
      this.contactType});

  factory Active.fromJson(Map<String, dynamic> json) => Active(
      id: json['id'] as String?,
      passDate: json['pass_date'] as String?,
      userId: json['user_id'] as String?,
      contactId: json['contact_id'] as dynamic,
      qrCode: json['qr_code'] as String?,
      scanAt: json['scan_at'] as dynamic,
      scanBy: json['scan_by'] as dynamic,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      userName: json['user_name'] as String?,
      contactName: json['contact_name'] ?? "" as String,
      contactPhone: json['contact_phone'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactType: json['contact_type'] as String?);

  Pass toDomain() => Pass(
      id: id ?? "",
      passDate: passDate ?? "",
      userId: userId ?? "",
      contactId: contactId ?? "",
      qrCode: qrCode ?? "",
      userName: userName ?? "",
      contactName: contactName ?? "",
      contactPhone: contactPhone ?? "",
      contactEmail: contactEmail ?? "",
      contactType: contactType ?? "");
}
