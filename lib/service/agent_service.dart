import 'package:velorant/api/api_routes.dart';
import 'package:velorant/api/api_service.dart';
import 'package:velorant/model/agent_model.dart';

class AgentService {
  static Future agentService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.agent,
    );

    AgentResponseModel agentResponseModel =
        AgentResponseModel.fromJson(response);
    return agentResponseModel;
  }
}
