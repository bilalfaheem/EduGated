import 'package:flutter_bloc/flutter_bloc.dart';
import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassCubit extends Cubit<GenerateGatePassState> {
  final GenerateGatePassInitialParams initialParams;

  GenerateGatePassCubit(this.initialParams)
      : super(GenerateGatePassState.initial(initialParams: initialParams));

  void onStepUpdate(bool secondStep) =>
      emit(state.copyWith(firstStep: secondStep));
}
