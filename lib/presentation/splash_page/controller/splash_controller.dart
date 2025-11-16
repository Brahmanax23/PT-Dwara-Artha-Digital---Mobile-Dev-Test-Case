import 'package:flutter/material.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/presentation/splash_page/model/splash_ticket_model.dart';
import 'package:testcase/presentation/splash_page/model/splash_view_model.dart';
import 'package:testcase/presentation/splash_page/service/splash_service.dart';
import 'package:testcase/ui_kit/constant.dart';
// import 'package:provider/provider.dart';

class SplashController with ChangeNotifier {
  final SplashViewModel viewModel;
  final SplashService service;

  SplashController({
    required this.viewModel,
    required this.service,
  });

  void onReady() async {
    await getData();
  }

  Case<SplashTicketModel> get getCase => viewModel.getCase;
  Case<SplashTicketModel> get saveCase => viewModel.saveCase;

  Future<void> getData() async {
    viewModel.getCase = LoadingCase<SplashTicketModel>();
    notifyListeners();

    final response = await service.getData();

    response.fold(
      (failure) {
        viewModel.getCase = ErrorCase(failure);
        notifyListeners();
      },
      (result) async {
        viewModel.getCase = LoadedCase(result);
        notifyListeners();

        final data = result;
        if (data.items.isEmpty) {
          saveData();
        }
      },
    );
  }

  Future<void> saveData() async {
    viewModel.saveCase = LoadingCase<SplashTicketModel>();
    notifyListeners();

    final response = await service.saveData(
      model: SplashTicketModel(
        items: [
          SplashTicketModelItem(
            id: 1,
            title: 'Server Down',
            description: 'Server utama tidak dapat diakses sejak pagi hari.',
            category: 'Infrastructure',
            status: Constant.ticketOpen,
            createdAt: '2025-01-01T08:30:00',
          ),
          SplashTicketModelItem(
            id: 2,
            title: 'Bug Login Error',
            description:
                'User gagal login ketika password mengandung karakter spesial.',
            category: 'Bug',
            status: Constant.ticketInProgress,
            createdAt: '2025-01-05T10:12:00',
          ),
          SplashTicketModelItem(
            id: 3,
            title: 'Request Fitur Dark Mode',
            description: 'User meminta penambahan fitur dark mode.',
            category: 'Feature Request',
            status: Constant.ticketOpen,
            createdAt: '2025-01-10T14:20:00',
          ),
          SplashTicketModelItem(
            id: 4,
            title: 'Optimasi Dashboard',
            description:
                'Dashboard terasa lambat ketika memuat grafik statistik.',
            category: 'Performance',
            status: Constant.ticketInProgress,
            createdAt: '2025-01-15T09:45:00',
          ),
          SplashTicketModelItem(
            id: 5,
            title: 'Sinkronisasi Data Error',
            description:
                'Data user tidak tersinkron saat koneksi kembali hidup.',
            category: 'Sync Issue',
            status: Constant.ticketDone,
            createdAt: '2025-01-20T11:30:00',
          ),
        ],
      ),
    );

    response.fold(
      (failure) {
        viewModel.saveCase = ErrorCase(failure);
        notifyListeners();
      },
      (result) async {
        viewModel.saveCase = LoadedCase(result);
        notifyListeners();
      },
    );
  }
}
