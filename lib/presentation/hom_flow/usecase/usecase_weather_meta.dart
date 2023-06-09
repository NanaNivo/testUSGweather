



import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/core/param/base_param.dart';
import 'package:testusg/core/param/no_param.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/core/usecases/base_use_case.dart';
import 'package:testusg/presentation/hom_flow/repository/repository_home.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';

class WeatherMetaUseCase extends UseCase<Future<Result<BaseError,WeatherMeta >>,WeatherMetaParams>
{
  final HomeRepository homeRepository;
  WeatherMetaUseCase({this.homeRepository});
  @override
  Future<Result<BaseError, WeatherMeta>> call(WeatherMetaParams params) async {

    final result=await homeRepository.weatherRepo(weatherMetaRequest:params.weatherMetaRequest );
    if (result.hasDataOnly) {

      return Result(data: result.data);
    }
    return Result(error: result.error);
  }
}
class WeatherMetaParams extends BaseParams
{
  WeatherMetaRequest weatherMetaRequest;
  WeatherMetaParams({this.weatherMetaRequest});
}

// class GetWeatherMetaParams extends BaseParams {
//   // final int parentId;
//   // final int page;
//   // final int pageSize;
//   final
//
//   GetWeatherMetaParams({this.parentId, this.page, this.pageSize});
// }

// class PokemonListWrapper extends UseCaseWrapper<Results, PaginationParams> {
//   final PokemonListUseCase pokemonListUseCase;
//
//   PokemonListWrapper(this.pokemonListUseCase);
//
//   @override
//   Future<List<Results>> caller(PaginationParams params) async {
//     final   response = await pokemonListUseCase(GetListPokemanParams(page: params.startIndex));
//     Result<BaseError, List<Results>> tempRes=Result(error:response.error,data: response.data.results );
//     return responseChecker(tempRes);
//   }
// }

