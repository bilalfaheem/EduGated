import 'package:edugated/domain/entities/contact.dart';
import 'package:edugated/domain/entities/user.dart';

class GenerateGatePassState {
  final User user;
  final List<Contact> contacts;
  final bool isLoading;
  final bool isgenerateLoading;

  final String? error;
  final String? selectedDate;
  final String? contactId;

  const GenerateGatePassState(
      {required this.contacts,
      required this.isLoading,
      required this.user,

      required this.isgenerateLoading,
      this.error,
      this.selectedDate,
      this.contactId});

  factory GenerateGatePassState.initial(User user) =>  GenerateGatePassState(
      contacts: [], isLoading: false, isgenerateLoading: false,user: user);

  GenerateGatePassState copyWith(
          {bool? firstStep,
          List<Contact>? contacts,
          bool? isLoading,
          bool? isgenerateLoading,
          String? selectedDate,
          String? contactId,
          String? error}) =>
      GenerateGatePassState(
        user: user,
          contacts: contacts ?? this.contacts,
          isLoading: isLoading ?? this.isLoading,
          isgenerateLoading: isgenerateLoading ?? this.isgenerateLoading,
          selectedDate: selectedDate ?? this.selectedDate,
          contactId: contactId ?? this.contactId,
          error: error ?? this.error);
}
