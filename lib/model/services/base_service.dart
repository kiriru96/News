abstract class BaseService {
  final String mediaBaseUrl =
      "https://60a4954bfbd48100179dc49d.mockapi.io/api/";

  Future<dynamic> getResponse(String url);
}
