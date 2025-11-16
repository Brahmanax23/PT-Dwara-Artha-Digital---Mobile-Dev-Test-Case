import 'package:flutter/material.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/add_pages/controller/add_pages_controller.dart';
import 'package:testcase/presentation/add_pages/model/add_pages_model.dart';
import 'package:testcase/ui_kit/constant.dart';
import 'package:testcase/util/extension/extension.dart';

class AddPagesViewModel {
  final formKey = GlobalKey<FormState>();
  final saveCase = ValueNotifier<Case<AddPagesModel>>(Case());
  final getCase = ValueNotifier<Case<AddPagesModel>>(Case());
  final statusState = ValueNotifier<String>(Constant.ticketOpen);

  final titleText = TextEditingController();
  final descriptionText = TextEditingController();
  final categoryText = TextEditingController();

  void listener(AddPagesController controller) {
    final context = Navigate.getCurrentContext();

    saveCase.addListener(() async {
      final state = saveCase.value;

      if (state is ErrorCase) {
        await context?.toastWithBarrier(
          text: state.failure,
          color: Colors.red,
          backgroundInteraction: true,
        );
      } else if (state is LoadedCase) {
        await context?.toastWithBarrier(
          text: 'Berhasil menyimpan tiket!',
          color: Colors.black,
          backgroundInteraction: true,
        );
        Navigate.goBack(value: true);
      }
    });

    getCase.addListener(() async {
      final state = getCase.value;

      if (state is ErrorCase) {
        await context?.toastWithBarrier(
          text: state.failure,
          color: Colors.red,
          backgroundInteraction: true,
        );
      } else if (state is LoadedCase) {}
    });
  }

  void dispose() {
    saveCase.dispose();
    getCase.dispose();

    titleText.dispose();
    descriptionText.dispose();
    categoryText.dispose();
  }
}
