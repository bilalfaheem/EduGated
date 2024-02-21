import 'package:edugated/domain/entities/contact.dart';

class GenerateGatePassState {
  final bool firstStep;
  final List<Contact> contacts;
  final bool isLoading;
  final String? error;

  const GenerateGatePassState({
    required this.firstStep,
    required this.contacts,
    required this.isLoading,
    this.error,
  });

  factory GenerateGatePassState.initial() => const GenerateGatePassState(
      firstStep: true, contacts: [], isLoading: false);

  GenerateGatePassState copyWith(
          {bool? firstStep,
          List<Contact>? contacts,
          bool? isLoading,
          String? error}) =>
      GenerateGatePassState(
          firstStep: firstStep ?? this.firstStep,
          contacts: contacts ?? this.contacts,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
