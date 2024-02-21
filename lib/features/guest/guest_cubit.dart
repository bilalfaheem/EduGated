import 'package:edugated/features/generate_gate_pass/generate_gate_pass_initial_params.dart';
import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';
import 'package:edugated/features/guest/guest_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'guest_initial_params.dart';
import 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final GuestInitialParams initialParams;
  final GuestNavigator navigator;

  GuestCubit(this.initialParams, this.navigator)
      : super(GuestState.initial(initialParams: initialParams));

  onTabUpdated(GuestPassType type) => emit(state.copyWith(selectedTab: type));

  onTapCreateGuestPass(GenerateGatePassInitialParams initialParams) =>
      navigator.openGenerateGatePass(initialParams);
}
