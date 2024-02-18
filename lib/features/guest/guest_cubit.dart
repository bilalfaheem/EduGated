import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'guest_initial_params.dart';
import 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final GuestInitialParams initialParams;

  GuestCubit(this.initialParams) : super(GuestState.initial(initialParams: initialParams));

   onTabUpdated(GuestPassType type) => emit(state.copyWith(selectedTab:type));
}
