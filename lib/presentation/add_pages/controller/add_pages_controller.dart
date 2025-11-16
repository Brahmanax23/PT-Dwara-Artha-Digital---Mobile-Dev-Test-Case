import 'package:flutter/material.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/add_pages/model/add_pages_model.dart';
import 'package:testcase/presentation/add_pages/model/add_pages_view_model.dart';
import 'package:testcase/presentation/add_pages/service/add_pages_service.dart';
import 'package:testcase/ui_kit/constant.dart';

class AddPagesController with ChangeNotifier {
  final AddPagesViewModel viewModel;
  final AddPagesService service;

  AddPagesController({
    required this.viewModel,
    required this.service,
  });

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void onReady() async {
    viewModel.listener(this);
    await getData();
  }

  Future<void> getData() async {
    viewModel.getCase.value = LoadingCase();
    final response = await service.getData();

    response.fold(
      (failure) => viewModel.getCase.value = ErrorCase(failure),
      (result) async {
        viewModel.getCase.value = LoadedCase(result);
      },
    );
  }

  Future<void> saveData(AddPagesModel model) async {
    viewModel.getCase.value = LoadingCase();

    final response = await service.saveData(
      model: model,
    );

    response.fold(
      (failure) => viewModel.saveCase.value = ErrorCase(failure),
      (result) async {
        viewModel.saveCase.value = LoadedCase(result);
      },
    );
  }

  void submitData() {
    final data = viewModel.getCase.value.data ?? AddPagesModel();
    final maxIdValue = data.items.reduce((a, b) => a.id > b.id ? a : b);

    final newData = AddPagesModelItem(
      id: maxIdValue.id + 1,
      category: viewModel.categoryText.text,
      createdAt: DateTime.now().toString(),
      description: viewModel.descriptionText.text,
      title: viewModel.titleText.text,
      status: viewModel.statusState.value,
    );

    data.items.add(newData);

    data.items.sort((a, b) => a.id.compareTo(b.id));

    saveData(data);
  }
}