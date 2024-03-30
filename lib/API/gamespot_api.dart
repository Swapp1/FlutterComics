import 'package:comics_app/models/event_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'gamespot_api.g.dart';

@RestApi()
abstract class APIrequest {
  factory APIrequest(Dio dio, {required String baseUrl}) = _APIrequest;

  @GET('articles')
  Future<EventModel> getEvents(@Query('limit') int limit);
}

class EventRequest {
  final APIrequest _api = APIrequest(
      Dio(
        BaseOptions(
          queryParameters: {
            'api_key': '3fc32ddca87b91f50c6eb739a7ac11ba10ce8c92',
            'format': 'json',
            'sort' :  'publish_date:desc',
          },
        ),
      ),
      baseUrl: 'http://www.gamespot.com/api/');

  Future<EventModel> loadEvents() {
    return _api.getEvents(2);
  }

}