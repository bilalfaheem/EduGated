import 'package:edugated/domain/entities/activity.dart';
import 'package:edugated/domain/entities/user.dart';

class ActivityState {
  final User user;

  final List<Activity> activities;
  final bool isLoading;
  final String? error;
  const ActivityState({
    required this.activities,
    required this.isLoading,
    this.error,
    required this.user,
  });

  factory ActivityState.initial() =>
      const ActivityState(activities: [], isLoading: false, user: User.empty());

  ActivityState copyWith(
          {List<Activity>? activities,
          bool? isLoading,
          String? error,
          User? user}) =>
      ActivityState(
          user: user ?? User.empty(),
          activities: activities ?? this.activities,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
