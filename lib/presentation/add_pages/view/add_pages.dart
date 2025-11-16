import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/add_pages/controller/add_pages_controller.dart';
import 'package:testcase/presentation/add_pages/model/add_pages_view_model.dart';
import 'package:testcase/presentation/add_pages/service/add_pages_service.dart';

class AddPages extends StatelessWidget {
  static const page = '/add_pages';

  const AddPages({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final controller = AddPagesController(
          viewModel: AddPagesViewModel(),
          service: AddPagesService(
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
                'Add Ticket',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: _Body(
              controller: context.read<AddPagesController>(),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final AddPagesController controller;

  const _Body({required this.controller});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.h,
        ),
        child: Form(
          key: controller.viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: controller.viewModel.titleText,
                validator: (value) {
                  final text = value ?? '';

                  if (text.isEmpty) {
                    return 'Title tidak boleh kosong';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: controller.viewModel.descriptionText,
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: controller.viewModel.categoryText,
              ),
              SizedBox(
                height: 3.h,
              ),
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
                    onPressed: () {
                      final valid = controller.viewModel.formKey.currentState
                              ?.validate() ??
                          false;
                      if (valid) {
                        controller.submitData();
                      }
                    },
                    child: const Text(
                      'Submit Ticket',
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
