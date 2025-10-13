import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Jobs/ViewJopApplicationControllrt.dart';

class CommentsSectionJobApp extends StatelessWidget {
  final int jobId;
  final ViewJopApplicationControllerImp controller =
      Get.find<ViewJopApplicationControllerImp>();
  final TextEditingController commentController = TextEditingController();

  CommentsSectionJobApp({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final comments = controller.commentsList[jobId] ?? [];
      final count = controller.commentsCount[jobId] ?? 0;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان التعليقات + العدد
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              "${"198".tr} ($count)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          // عرض التعليقات أو رسالة لا توجد تعليقات
          comments.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("199".tr),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    final isOwner = comment.userId ==
                        controller.myServices.sharedPreferences
                            .getInt("idUser");

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            child: Icon(Icons.person, size: 20),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.userName ?? "",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(comment.content ?? ""),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      comment.createdAt ?? "",
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // قائمة تعديل/حذف التعليق للمالك فقط
                          if (isOwner)
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'edit') {
                                  _showEditDialog(
                                      context,
                                      jobId,
                                      comment.id.toString(),
                                      comment.content ?? "");
                                } else if (value == 'delete') {
                                  controller.deleteComment(
                                      jobId, comment.id.toString());
                                }
                              },
                              itemBuilder: (context) => const [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Text('تعديل'),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('حذف'),
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),

          const Divider(),

          // إضافة تعليق جديد
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                child: Icon(Icons.person, size: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: "أكتب تعليقًا...",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: () {
                  if (commentController.text.trim().isNotEmpty) {
                    controller.addComment(jobId, commentController.text.trim());
                    commentController.clear();
                  }
                },
              )
            ],
          ),
        ],
      );
    });
  }

  void _showEditDialog(
      BuildContext context, int jobId, String commentId, String oldText) {
    final editController = TextEditingController(text: oldText);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تعديل التعليق"),
        content: TextField(
          controller: editController,
          maxLines: 3,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              if (editController.text.trim().isNotEmpty) {
                controller.editComment(
                    jobId, commentId, editController.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text("حفظ"),
          ),
        ],
      ),
    );
  }
}
