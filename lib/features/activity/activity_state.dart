import 'package:edugated/domain/entities/activity.dart';

class ActivityState {
  final List<Activity> activities;
  final bool isLoading;
  final String? error;
  const ActivityState(
      {required this.activities, required this.isLoading, this.error});

  factory ActivityState.initial() =>
      const ActivityState(activities: [], isLoading: false);

  ActivityState copyWith(
          {List<Activity>? activities, bool? isLoading, String? error}) =>
      ActivityState(
          activities: activities ?? this.activities,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
