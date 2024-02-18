import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';

import 'guest_initial_params.dart';

class GuestState {
  final GuestPassType selectedTab;

  const GuestState({required this.selectedTab});

  factory GuestState.initial({required GuestInitialParams initialParams}) =>
      const GuestState(selectedTab: GuestPassType.active);

  GuestState copyWith({GuestPassType? selectedTab}) =>
      GuestState(selectedTab: selectedTab ?? this.selectedTab);
}
