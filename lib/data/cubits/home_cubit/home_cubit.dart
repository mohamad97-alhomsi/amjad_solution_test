import 'package:amjad_solutions_test/constants/api_constants.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/data/models/offers_model.dart';
import 'package:amjad_solutions_test/services/network_service/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _apiCLinet = ApiClient();
  HomeCubit() : super(HomeInitial());
  
getOffersCubit()async{
  try {
    emit(OfferLoadingState());
    var result = await _apiCLinet.get(ApiConstants.offers);
    if(result.body['success'] == true){
      OffersModel offersModel = OffersModel.fromJson(result.body['content']);
      emit(OfferSuccessState(offersModel: offersModel));
    }
  } catch (e) {
    emit(OfferErrorState());
  }
}
}
