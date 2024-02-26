import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_initial_params.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileInitialParams initialParams;

  ProfileCubit(this.initialParams) : super(ProfileState.initial());
}
