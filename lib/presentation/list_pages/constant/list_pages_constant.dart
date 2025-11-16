import 'package:testcase/ui_kit/constant.dart';

class ListPagesConstant {
  static List<Map<String, String>> statusTabs = [
    {'name': 'All', 'value': ""},
    {'name': 'Open', 'value': Constant.ticketOpen},
    {'name': 'In Progress', 'value': Constant.ticketInProgress},
    {'name': 'Done', 'value': Constant.ticketDone},
  ];
}
