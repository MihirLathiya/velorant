import 'package:get/get.dart';
import 'package:velorant/api/api_response.dart';
import 'package:velorant/model/map_model.dart';
import 'package:velorant/service/map_service.dart';

class MapController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getMapData();
  }

  Future getMapData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading...');
    try {
      MapResponseModel? mapResponseModel = await MapService.mapService();
      _apiResponse = ApiResponse.complete(mapResponseModel);
    } catch (e) {
      print('ERROR : $e');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
