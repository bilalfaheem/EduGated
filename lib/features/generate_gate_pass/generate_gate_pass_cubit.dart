import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:edugated/features/add_contact/add_contact_initial_params.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassCubit extends Cubit<GenerateGatePassState> {
  final GenerateGatePassInitialParams initialParams;
  final ContactsRepository contactsRepository;
  final GenerateGatePassNavigator navigator;

  GenerateGatePassCubit(
      this.initialParams, this.contactsRepository, this.navigator)
      : super(GenerateGatePassState.initial());

  void onStepUpdate(bool secondStep) =>
      emit(state.copyWith(firstStep: secondStep));

  Future<void> fetchContacts() async {
    emit(state.copyWith(isLoading: true, error: null));
    await contactsRepository.getContacts({"user_id": "2"}).then((value) async =>
        value.fold((error) => emit(state.copyWith(error: error.error)),
            (contacts) async {
          await Future.delayed(Duration(seconds: 1));
          emit(state.copyWith(contacts: contacts, isLoading: false));
        }));
  }

  onTapAddContact(AddContactInitialParams initialParams) =>
      navigator.openAddContact(initialParams);
}
