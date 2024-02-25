import 'package:edugated/features/guest_pass/guest_pass_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'guest_pass_initial_params.dart';
import 'guest_pass_state.dart';

class GuestPassCubit extends Cubit<GuestPassState> {
  final GuestPassInitialParams initialParams;


  GuestPassCubit(this.initialParams) : super(GuestPassState.initial(initialParams: initialParams));
}
