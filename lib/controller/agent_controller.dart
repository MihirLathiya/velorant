import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velorant/api/api_response.dart';
import 'package:velorant/model/agent_model.dart';
import 'package:velorant/service/agent_service.dart';

class AgentController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getAgentData();
  }

  Future getAgentData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading...');
    try {
      AgentResponseModel? agentResponseModel =
          await AgentService.agentService();
      _apiResponse = ApiResponse.complete(agentResponseModel);
    } catch (e) {
      print('ERROR : $e');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
