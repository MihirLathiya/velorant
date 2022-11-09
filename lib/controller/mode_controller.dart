import 'package:get/get.dart';
import 'package:velorant/api/api_response.dart';
import 'package:velorant/model/mode_model.dart';
import 'package:velorant/model/rank_model.dart';
import 'package:velorant/service/rank_service.dart';

import '../service/mode_service.dart';

class ModeController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getModeData();
  }

  Future getModeData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading...');
    try {
      ModeResponseModel? modeResponseModel = await ModeService.modeService();
      _apiResponse = ApiResponse.complete(modeResponseModel);
    } catch (e) {
      print('ERROR : $e');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
