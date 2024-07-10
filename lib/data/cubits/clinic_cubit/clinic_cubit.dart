import 'package:amjad_solutions_test/constants/api_constants.dart';
import 'package:amjad_solutions_test/data/models/clinic_model.dart';
import 'package:amjad_solutions_test/services/network_service/api_client.dart';
import 'package:amjad_solutions_test/services/storage_service/shared_prefrence.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clinic_state.dart';

class ClinicCubit extends Cubit<ClinicState> {
  final _apiCLinet = ApiClient();
  final _pref = StorageHelper();
  ClinicCubit() : super(ClinicInitial());
  Future getClinicsCubit() async {
    try {
      emit(ClinicLoadingState());
      String? token = _pref.getString("token");

      var result = await _apiCLinet.post(ApiConstants.home, parameters: {
        "type": "clinic"
      }, headers: {
        ApiConstants.contentType: ApiConstants.applicationJson,
        ApiConstants.authorization: "Bearer $token"
      });
      if (result.body['success'] == true) {
        ClinicModel clinicModel = ClinicModel.fromJson(result.body);
        emit(ClinicSuccessState(clinicModel: clinicModel));
      }
    } catch (e) {
      emit(ClinicErrorStateState(error: e));
    }
  }
}
