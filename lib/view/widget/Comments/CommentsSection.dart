import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Ads/ItemDetalisController.dart';

class CommentsSection extends StatelessWidget {
  final ItemDetailsController controller = Get.find<ItemDetailsController>();
  final TextEditingController commentController = TextEditingController();

  CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// العنوان + العدد
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              "${"198".tr} (${controller.commentsCount.value})",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          /// قائمة التعليقات
          controller.commentsList.isEmpty
              ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("199".tr),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.commentsList.length,
                  itemBuilder: (context, index) {
                    final comment = controller.commentsList[index];
                    final isOwner = comment.userId ==
                        controller.myServices.sharedPreferences
                            .getInt("idUser");

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// صورة البروفايل
                          const CircleAvatar(
                            radius: 18,
                            child: Icon(Icons.person, size: 20),
                          ),
                          const SizedBox(width: 8),

                          /// نص التعليق
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
                                        "${comment.userName}", // 👈 اسم المستخدم (بدلها لاحقًا من الـ API)
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(comment.content!),
                                    ],
                                  ),
                                ),

                                /// خيارات تحت التعليق
                                Row(
                                  children: [
                                    /*TextButton(
                                      onPressed: () {},
                                      child: const Text("إعجاب",
                                          style: TextStyle(fontSize: 13)),
                                    ),*/
                                    /*TextButton(
                                      onPressed: () {},
                                      child: const Text("رد",
                                          style: TextStyle(fontSize: 13)),
                                    ),*/
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

                          /// منيو لصاحب التعليق
                          if (isOwner)
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'edit') {
                                  _showEditDialog(context,
                                      comment.id.toString(), comment.content!);
                                } else if (value == 'delete') {
                                  controller
                                      .deleteComment(comment.id.toString());
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('تعديل'),
                                ),
                                const PopupMenuItem(
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

          /// حقل إضافة تعليق جديد (مثل فيسبوك)
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
                    controller.addComment(commentController.text.trim());
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

  /// نافذة تعديل التعليق
  void _showEditDialog(BuildContext context, String commentId, String oldText) {
    final editController = TextEditingController(text: oldText);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تعديل التعليق"),
        content: TextField(
          controller: editController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              if (editController.text.trim().isNotEmpty) {
                controller.editComment(commentId, editController.text.trim());
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
