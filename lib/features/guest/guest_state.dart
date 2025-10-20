import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';

class GuestState {
  final User user;
  final bool isLoading;
  final List<Pass> active;
  final List<Pass> history;

  final GuestPassType selectedTab;
  final String? error;

  const GuestState(

      {required this.isLoading,
      required this.selectedTab,
      required this.user,

      required this.active,
      required this.history,
      this.error});

  factory GuestState.initial(User user) =>  GuestState(
      user: user,
      isLoading: false,
      selectedTab: GuestPassType.active,
      active: [],
      history: []);

  GuestState copyWith(
          {bool? isLoading,
          GuestPassType? selectedTab,
          List<Pass>? active,
          List<Pass>? history,
          String? error}) =>
      GuestState(
          user: user,
          isLoading: isLoading ?? this.isLoading,
          selectedTab: selectedTab ?? this.selectedTab,
          active: active ?? this.active,
          history: history ?? this.history,
          error: error ?? this.error);
}
