import 'package:edugated/domain/entities/user.dart';

import 'home_initial_params.dart';

class HomeState {
  final int selectedPageIndex;
  final User user;

  const HomeState({
    required this.selectedPageIndex,
    required this.user,
  });

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      const HomeState(selectedPageIndex: 0, user: User.empty());

  HomeState copyWith({int? selectedPageIndex, User? user}) => HomeState(
        selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
        user: user ?? this.user,
      );
}
