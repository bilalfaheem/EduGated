import 'guest_initial_params.dart';

class GuestState {

const GuestState();

factory GuestState.initial({required GuestInitialParams initialParams}) => GuestState();

GuestState copyWith() => const GuestState();
}
