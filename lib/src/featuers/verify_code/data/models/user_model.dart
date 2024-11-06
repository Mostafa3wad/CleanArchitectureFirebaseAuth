import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name,
      required super.email,
      required super.id,
      required super.gender,
      required super.userType,
      required super.phoneNumber});

  @override
  List<Object?> get props => [name, email, gender, userType];
}
