import 'package:amjad_solutions_test/constants/api_constants.dart';
import 'package:amjad_solutions_test/data/models/login_model.dart';
import 'package:amjad_solutions_test/services/network_service/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _apiClient =  ApiClient();
  LoginCubit() : super(LoginInitial());
  loginCubit(LoginModel loginModel)async{
    try {
      emit(LoginLoadingState());
      var result  =await  _apiClient.post(ApiConstants.login,body: loginModel.toJson());
      if(result.body['success']==true){
        emit(LoginSuccessState());
      }else {
        emit(LoginErrorState());
      }
      
    } catch (e) {
emit(LoginErrorState());

    }
  }
}
