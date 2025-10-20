import 'package:edugated/domain/repositories/guest_repository.dart';
import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_initial_params.dart';
import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';
import 'package:edugated/features/guest/guest_navigator.dart';
import 'package:edugated/features/guest_pass/guest_pass_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'guest_initial_params.dart';
import 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final GuestInitialParams initialParams;
  final GuestRepository _repo;
  final GuestNavigator navigator;
  final UserStore _userStore;

  GuestCubit(this.initialParams, this._repo, this.navigator,this._userStore)
      : super(GuestState.initial( _userStore.state));

  onTabUpdated(GuestPassType type) => emit(state.copyWith(selectedTab: type));

  onTapCreateGuestPass(GenerateGatePassInitialParams initialParams) =>
      navigator.openGenerateGatePass(initialParams);
  onTapGuestTile(GuestPassInitialParams initialParams) =>
      navigator.openGuestPass(initialParams);

  Future<void> fetchGuestPass() async {
    emit(state.copyWith(isLoading: true, error: null));
    await _repo.getGuestPass({'user_id': state.user.id ?? "0"}).then((value) =>
        value.fold(
            (error) => emit(state.copyWith(error: error.error)),
            (value) => emit(state.copyWith(
                active: value.$1, history: value.$2, isLoading: false))));
  }
}
