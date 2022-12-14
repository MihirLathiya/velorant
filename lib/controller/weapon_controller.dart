import 'package:get/get.dart';
import 'package:velorant/api/api_response.dart';
import 'package:velorant/model/weapon_model.dart';
import 'package:velorant/service/weapon_service.dart';

class WeaponController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getWeaponData();
  }

  Future getWeaponData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading...');
    try {
      WeaponResponseModel? weaponResponseModel =
          await WeaponService.weaponService();
      _apiResponse = ApiResponse.complete(weaponResponseModel);
    } catch (e) {
      print('ERROR : $e');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
