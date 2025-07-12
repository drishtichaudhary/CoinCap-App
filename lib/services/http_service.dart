import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio(); // Dio = actual http client used to interact with API and has services like get request, post request.
  AppConfig? _appConfig; // optional variables
  String? _base_url;

  HTTPService(){
    _appConfig = GetIt.instance.get<AppConfig>(); // reference to the AppConfig class
    _base_url = _appConfig!.COIN_API_BASE_URL; //overwriting the conditional check =>take responsibility that this variable is not going to be null
  }

  //function to go and do the get requests for a particular path
  Future<Response?> get(String _path) async {
    try{ //if the request fails, we dont want the app to crash
      // http.coingecko api + actual bitcoin path api
      String _url = "$_base_url$_path";
      Response _response = await dio.get(_url); //gonna wait for the get, and then return it
      return(_response);
    } catch(e) {
      print("HTTPService: Unable to perform a get request :(");
      print(e);
      return null;
    }
  }
}