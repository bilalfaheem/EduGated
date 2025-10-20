import 'package:edugated/domain/entities/user.dart';

class AddContactState {
  final User user;

  final bool isLoading;
  final String? contactImage;

  const AddContactState({required this.isLoading, this.contactImage,required this.user});

  factory AddContactState.initial({
    required User user
  }) =>
       AddContactState(isLoading: false, contactImage: null,user: user);

  AddContactState copyWith({bool? isLoading, String? contactImage}) =>
      AddContactState(
          isLoading: isLoading ?? this.isLoading,
          contactImage: contactImage ?? this.contactImage,
          user: user);
}
