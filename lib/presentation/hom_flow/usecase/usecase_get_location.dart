import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/param/no_param.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/core/usecases/base_use_case.dart';
import 'package:testusg/presentation/hom_flow/repository/repository_home.dart';
import 'package:geolocator/geolocator.dart';
class LocationUseCase extends UseCase<Future<Result<BaseError,Position > >,NoParams>
{
  final HomeRepository homeRepository;
  LocationUseCase({this.homeRepository});
  @override
  Future<Result<BaseError,Position > > call(NoParams params) async {

    final result=await homeRepository.getMyLocation( );
    if (result.hasDataOnly) {
      print("hrrrrr");

      return Result(data: result.data);
    }
    return Result(error: result.error);
  }
}