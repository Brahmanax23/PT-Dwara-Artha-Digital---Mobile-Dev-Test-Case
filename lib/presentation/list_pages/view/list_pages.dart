import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testcase/core/class/case.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/presentation/add_pages/view/add_pages_page.dart';
import 'package:testcase/presentation/detail_pages/argument/detail_pages_argument.dart';
import 'package:testcase/presentation/detail_pages/view/detail_pages_page.dart';
import 'package:testcase/presentation/list_pages/constant/list_pages_constant.dart';
import 'package:testcase/presentation/list_pages/controller/list_pages_controller.dart';
import 'package:testcase/presentation/list_pages/model/list_pages_get_ticket_model.dart';
import 'package:testcase/presentation/list_pages/model/list_pages_view_model.dart';
import 'package:testcase/presentation/list_pages/service/list_pages_service.dart';

part 'components/list_pages_item.dart';

class ListPages extends StatelessWidget {
  static const page = '/list_pages';

  const ListPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final controller = ListPagesController(
          viewModel: ListPagesViewModel(),
          service: ListPagesService(
            preferences: Navigate.getInstance(),
          ),
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.onReady();
        });

        return controller;
      },
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () async {
              final controller = context.read<ListPagesController>();
              final result = await Navigate.navigateTo(
                AddPagesPage.page,
              );

              if (result == true) {
                controller.getData();
              }
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: const Text(
              'Ticket List',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: DefaultTabController(
            length: ListPagesConstant.statusTabs.length,
            child: _Body(
              controller: context.read<ListPagesController>(),
            ),
          ),
        );
      }),
    );
  }
}

class _Body extends StatelessWidget {
  final ListPagesController controller;
  const _Body({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
          indicatorColor: Colors.amber,
          isScrollable: true,
          onTap: (index) {
            final controller = context.read<ListPagesController>();

            final map = ListPagesConstant.statusTabs[index];
            final value = map['value'] ?? '';
            controller.setFilter(value);
          },
          tabs: ListPagesConstant.statusTabs.map((e) {
            return Tab(
              child: Text(e['name'] ?? ''),
            );
          }).toList(),
        ),
        Expanded(
          child: Consumer<ListPagesController>(
            builder: (context, controller, child) {
              final getState = controller.getCase;
              final data = getState.data ?? ListPagesGetTicketModel();

              if (getState is LoadingCase) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              } else {
                final filteredItems = data.items.where((x) {
                  if (controller.filterState.isEmpty) return true;
                  return x.status
                      .toLowerCase()
                      .contains(controller.filterState.toLowerCase());
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    children: filteredItems.map((e) {
                      return InkWell(
                        onTap: () async {
                          final result = await Navigate.navigateToWithArgmnt(
                            DetailPagesPage.page,
                            DetailPagesArgument(id: e.id),
                          );

                          if (result == true) {
                            controller.getData();
                          }
                        },
                        child: _ListPagesItem(
                          data: e,
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
