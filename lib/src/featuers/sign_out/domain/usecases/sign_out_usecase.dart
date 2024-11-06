import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';
import '/src/featuers/sign_out/domain/repositories/sign_out_repo.dart';

class SignOutUsecase {
  final SignOutRepo repo;

  SignOutUsecase({required this.repo});

  Future<Either<Failure, Unit>> call() async => await repo.signOut();
}
