import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/verify_code_repo.dart';

class UploadUserDataUseCase {
  final VerifyRepo repo ;

  UploadUserDataUseCase(this.repo); 

  Future <Either<Failure, Unit>>call(UserEntity userEntity)async{
    return await repo.uploadUserData(userEntity);
  }
}