import 'package:edugated/features/home/home_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeInitialParams initialParams;
  final HomeNavigator navigator;

  HomeCubit(this.initialParams, this.navigator)
      : super(HomeState.initial(initialParams: initialParams));

onPageUpdate(int pageIndex)=> emit(state.copyWith(selectedPageIndex: pageIndex));
}
