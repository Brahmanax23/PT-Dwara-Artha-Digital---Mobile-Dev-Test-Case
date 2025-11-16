import 'package:flutter/material.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/presentation/detail_pages/argument/detail_pages_argument.dart';
import 'package:testcase/presentation/detail_pages/model/detail_pages_model.dart';
import 'package:testcase/presentation/detail_pages/model/detail_pages_view_model.dart';
import 'package:testcase/presentation/detail_pages/service/detail_pages_service.dart';

class DetailPagesController with ChangeNotifier {
  final DetailPagesViewModel viewModel;
  final DetailPagesService service;
  final DetailPagesArgument argument;

  DetailPagesController({
    required this.viewModel,
    required this.service,
    required this.argument,
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
      (failure) {
        viewModel.getCase.value = ErrorCase(failure);
      },
      (result) {
        viewModel.getCase.value = LoadedCase(result);
        notifyListeners();
        _fillForm();
      },
    );
  }

  void _fillForm() {
    final data = viewModel.getCase.value.data ?? DetailPagesModel();

    final item = data.items.firstWhere(
      (e) => e.id == argument.id,
      orElse: () => DetailPagesModelItem(),
    );

    if (item.id != 0) {
      viewModel.titleText.text = item.title;
      viewModel.descriptionText.text = item.description;
      viewModel.categoryText.text = item.category;

      viewModel.statusState.value = item.status;
    }
  }

  Future<void> saveData(DetailPagesModel model) async {
    viewModel.saveCase.value = LoadingCase();

    final response = await service.saveData(model: model);

    response.fold(
      (failure) {
        viewModel.saveCase.value = ErrorCase(failure);
      },
      (result) {
        viewModel.saveCase.value = LoadedCase(result);

        // Navigate.goBack(value: true);
      },
    );
  }

  void submitData() {
    final data = viewModel.getCase.value.data ?? DetailPagesModel();

    final item = data.items.firstWhere(
      (e) => e.id == argument.id,
      orElse: () => DetailPagesModelItem(),
    );

    if (item.id != 0) {
      data.items.removeWhere((e) => e.id == argument.id);

      final newData = DetailPagesModelItem(
        id: item.id,
        category: item.category,
        createdAt: DateTime.now().toString(),
        description: item.description,
        title: item.title,
        status: viewModel.statusState.value,
      );

      data.items.add(newData);
      data.items.sort((a, b) => a.id.compareTo(b.id));

      saveData(data);
    }
  }
}
