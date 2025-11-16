import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/class/either.dart';
import 'package:testcase/presentation/splash_page/model/splash_ticket_model.dart';
import 'package:testcase/ui_kit/constant.dart';

abstract class SplashServiceInterface {
  Future<Either<String, SplashTicketModel>> saveData({
    required SplashTicketModel model,
  });

  Future<Either<String, SplashTicketModel>> getData();
}

class SplashService implements SplashServiceInterface {
  final SharedPreferences preferences;

  SplashService({
    required this.preferences,
  });

  @override
  Future<Either<String, SplashTicketModel>> getData() async {
    try {
      final data = preferences.getString(Constant.ticketKey) ?? '';

      if (data.isNotEmpty) {
        return Right(SplashTicketModel.fromJson(data));
      } else {
        return Right(SplashTicketModel());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SplashTicketModel>> saveData(
      {required SplashTicketModel model}) async {
    try {
      await preferences.setString(Constant.ticketKey, model.toJson());

      return Right(model);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
