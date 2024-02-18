import 'package:edugated/domain/repositories/activity_repository.dart';
import 'package:edugated/features/activity/activity_navigator.dart';
import 'package:edugated/features/gate_pass/gate_pass_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'activity_initial_params.dart';
import 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final ActivityRepository activityRespository;
  final ActivityInitialParams initialParams;
  final ActivityNavigator navigator;

  ActivityCubit(this.initialParams, this.activityRespository, this.navigator)
      : super(ActivityState.initial());

  onTapPass() => navigator.openGatePass(const GatePassInitialParams());

  Future<void> fetchActivity() async {
    emit(state.copyWith(isLoading: true, error: null));
    await activityRespository.getActivities({'user_id': "2"}).then((value) =>
        value.fold(
            (error) => emit(state.copyWith(error: error.error)),
            (activities) => emit(
                state.copyWith(activities: activities, isLoading: false))));
  }
}
