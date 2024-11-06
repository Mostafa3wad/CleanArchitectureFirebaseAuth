import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '/src/featuers/forget_password/data/datasources/forget_password_datasource.dart';
import '/src/featuers/forget_password/data/datasources/forget_password_datasource_impl.dart';
import '/src/featuers/forget_password/data/repositories/forget_password_repository_impl.dart';
import '/src/featuers/forget_password/domain/repositories/forget_password_repo.dart';
import '/src/featuers/forget_password/domain/usecases/send_reset_password_usecase.dart';
import '/src/featuers/forget_password/presentation/cubit/forget_password_cubit.dart';
import '/src/featuers/sign_out/data/datasources/sign_out_datasource.dart';
import '/src/featuers/sign_out/data/datasources/sign_out_datasource_impl.dart';
import '/src/featuers/sign_out/data/repositories/sign_out_repository_impl.dart';
import '/src/featuers/sign_out/domain/repositories/sign_out_repo.dart';
import '/src/featuers/sign_out/domain/usecases/sign_out_usecase.dart';
import '/src/featuers/sign_out/presentation/cubit/sign_out_cubit.dart';
import 'src/featuers/verify_code/data/datasources/verify_code_remote_datasouruce.dart';
import 'src/featuers/verify_code/data/datasources/verify_code_remote_datasouruce_impl.dart';
import 'src/featuers/verify_code/data/repositories/verify_code_repository_impl.dart';
import 'src/featuers/verify_code/domain/repositories/verify_code_repo.dart';
import 'src/featuers/verify_code/domain/usecases/upload_user_data.dart';
import 'src/featuers/verify_code/domain/usecases/verify_code_usecase.dart';
import 'src/featuers/verify_code/presentation/cubit/verify_code_cubit.dart';
import 'src/featuers/login/data/datasources/remote/login_remote_datasource.dart';
import 'src/featuers/login/data/datasources/remote/login_remote_datasource_impl.dart';
import 'src/featuers/login/data/repositories/login_repo_impl.dart';
import 'src/featuers/login/domain/repositories/login_repo.dart';
import 'src/featuers/login/domain/usecases/login_with_email_and_password_usecase.dart';
import 'src/featuers/login/presentation/cubit/login_cubit.dart';
import '/src/core/network/network_info.dart';
import 'src/featuers/signup/data/datasources/signup_remote_datasource.dart';
import 'src/featuers/signup/data/datasources/signup_remote_datasource_impl.dart';
import 'src/featuers/signup/data/repositories/signup_repository_impl.dart';
import 'src/featuers/signup/domain/repositories/signup_repo.dart';
import 'src/featuers/signup/domain/usecases/create_account_with_email_and_pass_usercase.dart';
import 'src/featuers/signup/domain/usecases/send_verifed_code_usecase.dart';
import 'src/featuers/signup/presentation/cubit/signup_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  //  NetworkInfo و InternetConnectionChecker
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //>>>>>>>>>>>>>>>LOGIN Featuer<<<<<<<<<<<<<<<<<<<<<<<

  //  LoginRemoteDatasource
  sl.registerLazySingleton<LoginRemoteDatasource>(
      () => LoginRemoteDatasourceImpl(sl()));

  //  Repo
  sl.registerLazySingleton<LoginRepo>(
      () => LoginRepositoryImpl(loginDatasource: sl(), networkInfo: sl()));

  //  Usecase
  sl.registerLazySingleton(() => LoginWithEmailAndPasswordUsecase(sl()));

  //  Cubit
  sl.registerFactory(() => LoginCubit(sl()));

  //>>>>>>>>>>>>>>>SIGNUP Featuer<<<<<<<<<<<<<<<<<<<<<<<

  //  Datasource
  sl.registerLazySingleton<SignupRemoteDatasource>(
      () => SignupRemoteDatasourceImpl(sl()));

  //  Repo
  sl.registerLazySingleton<SignUpRepo>(
      () => SignupRepositoryImpl(signupDatasource: sl(), networkInfo: sl()));

  //  Usecases
  sl.registerLazySingleton(
      () => CreateAccountWithEmailAndPasswordUsecase(signUpRepo: sl()));
  sl.registerLazySingleton(() => SendVerifedCodeUsecase(sl()));

  //  Cubit
  sl.registerFactory(() => SignupCubit(
        createAccountUsercase: sl(),
        sendVerifedCodeUsecase: sl(),
      ));

  //>>>>>>>>>>>>>>>Verify Code<<<<<<<<<<<<<<<<<<<<<<<
  //  Datasource
  sl.registerLazySingleton<VerifyCodeRemoteDatasouruce>(() =>
      VerifyCodeRemoteDatasouruceImpl(firebaseAuth: sl(), firestore: sl()));

  //  Repo
  sl.registerLazySingleton<VerifyRepo>(() =>
      VerifyCodeRepositoryImpl(networkInfo: sl(), accountDatasouruce: sl()));

  //  Usecases
  sl.registerLazySingleton(() => UploadUserDataUseCase(sl()));
  sl.registerLazySingleton(() => VerifyCodeUsecase(sl()));

  //  Cubit
  sl.registerFactory(() => VerifyCodeCubit(
      uploadUserDataUseCase: sl(),
      verifyCodeUsecase: sl(),
      sendVerifedCodeUsecase: sl()));

  //>>>>>>>>>>>>>>>Forget Password<<<<<<<<<<<<<<<<<<<<<<<
  //  Datasource
  sl.registerLazySingleton<ForgetPasswordDatasource>(
      () => ForgetPasswordDatasourceImpl(firebaseAuth: sl()));

  //  Repo
  sl.registerLazySingleton<ForgetPasswordRepo>(() =>
      ForgetPasswordRepositoryImpl(
          networkInfo: sl(), forgetPasswordDatasource: sl()));

  //  Usecases
  sl.registerLazySingleton(() => SendResetPasswordUsecase(repo: sl()));

  //  Cubit
  sl.registerFactory(() => ForgetPasswordCubit(sl()));

  //>>>>>>>>>>>>>>>Sign out<<<<<<<<<<<<<<<<<<<<<<<
  //  Datasource
  sl.registerLazySingleton<SignOutDatasource>(
      () => SignOutDatasourceImpl(firebaseAuth: sl()));

  //  Repo
  sl.registerLazySingleton<SignOutRepo>(
      () => SignOutRepositoryImpl(signOutDatasource: sl()));

  //  Usecases
  sl.registerLazySingleton(() => SignOutUsecase(repo: sl()));

  //  Cubit
  sl.registerFactory(() => SignOutCubit(sl()));
}
