import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gate_pass_initial_params.dart';
import 'gate_pass_state.dart';

class GatePassCubit extends Cubit<GatePassState> {
  final GatePassInitialParams initialParams;
  final GatePassNavigator navigator;
  final UserStore _userStore;

  GatePassCubit(this.initialParams, this.navigator,this._userStore)
      : super(GatePassState.initial(initialParams: initialParams,user:  _userStore.state));
}
