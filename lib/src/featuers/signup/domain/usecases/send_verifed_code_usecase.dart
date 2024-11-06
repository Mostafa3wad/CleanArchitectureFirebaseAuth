import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';
import '../repositories/signup_repo.dart';

class SendVerifedCodeUsecase {
  final SignUpRepo signUpRepo;

  SendVerifedCodeUsecase(this.signUpRepo);

  Future<Either<Failure, String>> call({required String phoneNumber}) async {
    return await signUpRepo.sendVerifedCode(phoneNumber: phoneNumber);
  }
}
