 
import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
Future<void> setUp()async{
  // dio && apiService
  Dio dio=DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(()=>ApiService(dio));
  // loginRepo
  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(()=>LoginCubit(getIt())); 
}