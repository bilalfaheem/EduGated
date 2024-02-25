import 'guest_pass_initial_params.dart';

class GuestPassState {
  const GuestPassState();

  factory GuestPassState.initial(
          {required GuestPassInitialParams initialParams}) =>
      GuestPassState();

  GuestPassState copyWith() => const GuestPassState();
}
