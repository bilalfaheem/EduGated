

class ProfileState {
  final bool isLoading;
  final String? error;
  const ProfileState({required this.isLoading, this.error});

  factory ProfileState.initial() => const ProfileState(isLoading: false);

  ProfileState copyWith({bool? isLoading, String? error}) => ProfileState(
      isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
}
