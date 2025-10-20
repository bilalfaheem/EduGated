import 'package:edugated/domain/entities/user.dart';

import 'gate_pass_initial_params.dart';

class GatePassState {
  final User user;

  const GatePassState(this.user);

  factory GatePassState.initial(
          {required GatePassInitialParams initialParams, required User user}) =>
      GatePassState(user);

  GatePassState copyWith() =>  GatePassState(user);
}
