
import 'package:dio/dio.dart';
import 'package:testusg/app+injection/di.dart';




import '../resources/apis.dart';
import '../services/session_manager.dart';


class AuthInterceptor extends Interceptor {
  final SessionManager sessionManager;
  final Dio dio;
  RequestOptions _previousRequest;

  AuthInterceptor(this.sessionManager, this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('add key to header for all request');
    final token = await sessionManager.authToken;


    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
      final key="8da48e0876mshc7faad7ae7955edp17a7f9jsn71124de2df1e";
      if(key!=null)
        {
          options.headers['x-rapidapi-key']='60f5bbd94fmshdf88c0ac0daa23cp141249jsn08c91d3a1ec6';
          print("header${options.headers}");
        }
    _previousRequest = options;

    return handler.next(options);
  }



  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print("on Error${err.message}");
    // if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
    //   final tokens = await Future.wait(
    //       [sessionManager.authToken, sessionManager.refreshToken]);
    //
    //   try {
    //     final result = await _fetchNewToken(tokens.last, tokens.first);
    //     if (result.statusCode == 200) {
    //       final token = result.data['content']['token'];
    //       final refreshToken = result.data['content']['refresh_token'];
    //
    //       await sessionManager.persistToken(token);
    //       await sessionManager.persistRefreshToken(refreshToken);
    //
    //       _previousRequest.headers['Authorization'] = 'Bearer $token';
    //
    //       final response = await dio.request(
    //         _previousRequest.path,
    //         data: _previousRequest.data,
    //         options: Options(
    //           method: _previousRequest.method,
    //           headers: _previousRequest.headers,
    //           responseType: _previousRequest.responseType,
    //           contentType: _previousRequest.contentType,
    //         ),
    //       );
    //       handler.resolve(response);
    //     }
    //   } catch (error) {
    //     handler.next(error);
    //   }
    // } else {
    //
    //   handler.next(err);
    // }
  }

  Future<Response> _fetchNewToken(String refreshToken, String token) async {
    Dio dio = Dio();

    // Response response = await dio.post(ApiUrls.refreshToken,
    //     options: Options(
    //         headers: {
    //           SessionManager.authorizeToken: 'Bearer $token',
    //           "refresh-token": refreshToken,
    //           "content-Type": "application/json",
    //           "Accept": "application/json"
    //         },
    //          validateStatus: (status) {
    //            return status < 500 && status != 403 ;
    //          }
    //       )
    //     );
    // print('asdasdasd');
    //
    // return response;
  }
}

mixin RefreshableRequest {
  final AuthInterceptor authInterceptor = locator<AuthInterceptor>();

  Dio getRefreshableDio() {

    final dio = Dio();

    dio.interceptors.add(authInterceptor);
    print("auth RefreshableRequest");
    return dio;
  }
}
