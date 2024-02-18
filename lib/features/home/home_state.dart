import 'home_initial_params.dart';

class HomeState {
  final int selectedPageIndex;

  const HomeState({required this.selectedPageIndex});

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      const HomeState(selectedPageIndex: 0);

  HomeState copyWith({int? selectedPageIndex}) =>
      HomeState(selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex);
}
