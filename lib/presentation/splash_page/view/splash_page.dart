import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/list_pages/view/list_pages.dart';
import 'package:testcase/presentation/splash_page/controller/splash_controller.dart';
import 'package:testcase/presentation/splash_page/model/splash_view_model.dart';
import 'package:testcase/presentation/splash_page/service/splash_service.dart';
import 'package:testcase/util/extension/extension.dart';

class SplashPage extends StatelessWidget {
  static const page = '/splash_page';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final controller = SplashController(
          viewModel: SplashViewModel(),
          service: SplashService(
            preferences: Navigate.getInstance(),
          ),
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.onReady();
        });

        return controller;
      },
      child: Builder(
        builder: (context) {
          return const Scaffold(
            backgroundColor: Colors.amber,
            body: _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(
      builder: (context, controller, child) {
        final getState = controller.getCase;
        final saveState = controller.saveCase;

        if (getState is LoadingCase || saveState is LoadingCase) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          );
        } else if (getState is ErrorCase || saveState is ErrorCase) {
          final errorMessage = (getState is ErrorCase)
              ? getState.failure
              : (saveState is ErrorCase)
                  ? saveState.failure
                  : 'Terjadi kesalahan';

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await context.toastWithBarrier(
              text: errorMessage,
              color: Colors.red,
            );
          });

          return const SizedBox();
        } else if ((getState is LoadedCase || saveState is LoadedCase)) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await context.toastWithBarrier(
              text: 'Data berhasil dimuat!',
              color: Colors.black,
            );

            await Navigate.offAllNamed(ListPages.page);
          });
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
