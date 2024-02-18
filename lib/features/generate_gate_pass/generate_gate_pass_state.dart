import 'generate_gate_pass_initial_params.dart';

class GenerateGatePassState {
  final bool firstStep;

  const GenerateGatePassState({required this.firstStep});

  factory GenerateGatePassState.initial(
          {required GenerateGatePassInitialParams initialParams}) =>
      const GenerateGatePassState(firstStep: true);

  GenerateGatePassState copyWith({bool? firstStep}) =>
      GenerateGatePassState(firstStep: firstStep ?? this.firstStep);
}
