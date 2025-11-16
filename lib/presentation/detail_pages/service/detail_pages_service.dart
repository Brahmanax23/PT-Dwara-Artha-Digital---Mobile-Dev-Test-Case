import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/class/either.dart';
import 'package:testcase/presentation/detail_pages/model/detail_pages_model.dart';
import 'package:testcase/ui_kit/constant.dart';

abstract class DetailPagesServiceInterface {
  Future<Either<String, DetailPagesModel>> saveData({
    required DetailPagesModel model,
  });

  Future<Either<String, DetailPagesModel>> getData();
}

class DetailPagesService implements DetailPagesServiceInterface {
  final SharedPreferences preferences;

  DetailPagesService({
    required this.preferences,
  });

  @override
  Future<Either<String, DetailPagesModel>> getData() async {
    try {
      final data = preferences.getString(Constant.ticketKey) ?? '';

      if (data.isNotEmpty) {
        return Right(DetailPagesModel.fromJson(data));
      } else {
        return Right(DetailPagesModel());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, DetailPagesModel>> saveData(
      {required DetailPagesModel model}) async {
    try {
      await preferences.setString(Constant.ticketKey, model.toJson());

      return Right(model);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
