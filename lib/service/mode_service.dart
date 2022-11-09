import 'package:velorant/api/api_routes.dart';
import 'package:velorant/api/api_service.dart';
import 'package:velorant/model/mode_model.dart';

class ModeService {
  static Future modeService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.mode,
    );

    ModeResponseModel modeResponseModel = ModeResponseModel.fromJson(response);
    return modeResponseModel;
  }
}
