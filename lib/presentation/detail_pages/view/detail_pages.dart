import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/detail_pages/argument/detail_pages_argument.dart';
import 'package:testcase/presentation/detail_pages/constant/detail_pages_constant.dart';
import 'package:testcase/presentation/detail_pages/controller/detail_pages_controller.dart';
import 'package:testcase/presentation/detail_pages/model/detail_pages_view_model.dart';
import 'package:testcase/presentation/detail_pages/service/detail_pages_service.dart';

class DetailPages extends StatelessWidget {
  static const page = '/detail_pages';

  final DetailPagesArgument argument;

  const DetailPages({
    super.key,
    required this.argument,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final controller = DetailPagesController(
          argument: argument,
          viewModel: DetailPagesViewModel(),
          service: DetailPagesService(
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
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 8.w,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              centerTitle: false,
              title: const Text(
                'Detail & Edit Ticket',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPagesController>(
      builder: (_, controller, __) {
        final vm = controller.viewModel;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title'),
                SizedBox(height: 1.h),
                TextFormField(
                  readOnly: true,
                  controller: vm.titleText,
                ),
                SizedBox(height: 2.h),
                const Text('Description'),
                SizedBox(height: 1.h),
                TextFormField(
                  readOnly: true,
                  controller: vm.descriptionText,
                ),
                SizedBox(height: 2.h),
                const Text('Category'),
                SizedBox(height: 1.h),
                TextFormField(
                  readOnly: true,
                  controller: vm.categoryText,
                ),
                SizedBox(height: 2.h),
                const Text('Status'),
                SizedBox(height: 1.5.h),
                Selector<DetailPagesController, String>(
                  selector: (_, c) => c.viewModel.statusState.value,
                  builder: (_, statusState, __) {
                    return DropdownButtonFormField<String>(
                      value: statusState,
                      items: DetailPagesConstant.statusDropdown.map((e) {
                        return DropdownMenuItem(
                          value: e['value'] ?? '',
                          child: Text(e['name'] ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onChanged: (value) {
                        controller.viewModel.statusState.value = value ?? '';
                      },
                    );
                  },
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.submitData,
                    child: const Text('Update Ticket'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
