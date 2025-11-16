import 'package:flutter/material.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/presentation/list_pages/model/list_pages_get_ticket_model.dart';
import 'package:testcase/presentation/list_pages/model/list_pages_view_model.dart';
import 'package:testcase/presentation/list_pages/service/list_pages_service.dart';

class ListPagesController with ChangeNotifier {
  final ListPagesViewModel viewModel;
  final ListPagesService service;

  ListPagesController({
    required this.viewModel,
    required this.service,
  });

  void onReady() async {
    await getData();
  }

  Case<ListPagesGetTicketModel> get getCase => viewModel.getCase;
  String get filterState => viewModel.filterState;

  Future<void> getData() async {
    viewModel.getCase = LoadingCase();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    final response = await service.getData();

    response.fold(
      (failure) {
        viewModel.getCase = ErrorCase(failure);
        notifyListeners();
      },
      (result) async {
        viewModel.getCase = LoadedCase(result);
        notifyListeners();
      },
    );
  }

  void setFilter(String newFilter) {
    viewModel.filterState = newFilter;
    notifyListeners();
  }
}
