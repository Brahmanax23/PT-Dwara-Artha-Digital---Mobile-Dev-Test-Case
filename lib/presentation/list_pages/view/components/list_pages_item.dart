part of '../list_pages.dart';

class _ListPagesItem extends StatelessWidget {
  final ListPagesGetTicketModelItem data;

  const _ListPagesItem({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2), topRight: Radius.circular(2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    data.title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 3.h),
                        child: Text(
                          data.status,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 3.h),
                        child: Text(
                          data.category,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      const Text(
                        'Created Date',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 3.h),
                        child: Text(
                          DateFormat('d MMMM yyyy, HH:mm', 'id_ID')
                              .format(DateTime.parse(data.createdAt)),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: data.description != '',
                        child: ListTileTheme(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5.sp,
                          ),
                          child: ExpansionTile(
                            title: const Padding(
                              padding: EdgeInsets.zero,
                              child: Text(
                                'Deskripsi',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            expandedAlignment: Alignment.centerLeft,
                            children: [
                              Text(
                                data.description,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
