import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/class/either.dart';
import 'package:testcase/presentation/list_pages/model/list_pages_get_ticket_model.dart';
import 'package:testcase/ui_kit/constant.dart';

abstract class ListPagesServiceInterface {
  Future<Either<String, ListPagesGetTicketModel>> getData();
}

class ListPagesService implements ListPagesServiceInterface {
  final SharedPreferences preferences;

  ListPagesService({
    required this.preferences,
  });

  @override
  Future<Either<String, ListPagesGetTicketModel>> getData() async {
    try {
      final data = preferences.getString(Constant.ticketKey) ?? '';

      if (data.isNotEmpty) {
        return Right(ListPagesGetTicketModel.fromJson(data));
      } else {
        return Right(ListPagesGetTicketModel());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
