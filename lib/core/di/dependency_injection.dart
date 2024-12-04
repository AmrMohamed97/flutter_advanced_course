 
import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
Future<void> setUp()async{
  // dio && apiService
  Dio dio=DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(()=>ApiService(dio));
  // loginRepo
  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=>LoginCubit(getIt())); 
  // signupRepo
  getIt.registerLazySingleton<SignupRepo>(()=>SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(()=>SignupCubit(getIt()));
}