import 'package:flutter_bloc/flutter_bloc.dart';
import 'selection_initial_params.dart';
import 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  final SelectionInitialParams initialParams;

  SelectionCubit(this.initialParams) : super(SelectionState.initial());
}
