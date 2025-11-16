import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/class/either.dart';
import 'package:testcase/presentation/add_pages/model/add_pages_model.dart';
import 'package:testcase/ui_kit/constant.dart';

abstract class AddPagesServiceInterface {
  Future<Either<String, AddPagesModel>> saveData({
    required AddPagesModel model,
  });

  Future<Either<String, AddPagesModel>> getData();
}

class AddPagesService implements AddPagesServiceInterface {
  final SharedPreferences preferences;

  AddPagesService({
    required this.preferences,
  });

  @override
  Future<Either<String, AddPagesModel>> getData() async {
    try {
      final data = preferences.getString(Constant.ticketKey) ?? '';

      if (data.isNotEmpty) {
        return Right(AddPagesModel.fromJson(data));
      } else {
        return Right(AddPagesModel());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AddPagesModel>> saveData(
      {required AddPagesModel model}) async {
    try {
      await preferences.setString(Constant.ticketKey, model.toJson());

      return Right(model);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
