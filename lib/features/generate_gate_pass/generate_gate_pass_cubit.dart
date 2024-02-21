import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassCubit extends Cubit<GenerateGatePassState> {
  final GenerateGatePassInitialParams initialParams;
  final ContactsRepository contactsRepository;

  GenerateGatePassCubit(this.initialParams, this.contactsRepository)
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
}
