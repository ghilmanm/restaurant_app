import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';

class AddReviewDialog extends StatelessWidget {
  const AddReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? params;
    TextEditingController nameC = TextEditingController();
    TextEditingController reviewC = TextEditingController();
    final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                const Spacer(),
                const Text(
                  'Add Review',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                )
              ],
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: addFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameC,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap nama terisi';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: const TextStyle(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap review terisi';
                            }
                            return null;
                          },
                          controller: reviewC,
                          decoration: InputDecoration(
                            hintText: "Review",
                            hintStyle: const TextStyle(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (addFormKey.currentState!.validate()) {
                            params = {
                              'name': nameC.text,
                              'review': reviewC.text
                            };
                            return Get.back(result: params);
                          }
                        },
                        child: const Text('Tambah'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // return AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   elevation: 0.0,
    //   backgroundColor: Colors.transparent,
    //   title: Stack(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         padding: const EdgeInsets.all(18.0),
    //         decoration: const BoxDecoration(
    //           color: Color(0xFF0D314B),
    //           shape: BoxShape.rectangle,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16.0),
    //             topRight: Radius.circular(16.0),
    //           ),
    //         ),
    //         child: const Center(
    //           child: Text(
    //             "Add Review",
    //             style: TextStyle(
    //               fontSize: 14.0,
    //               fontWeight: FontWeight.w700,
    //               color: Color(0xFFF1F4F8),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: IconButton(
    //           color: Colors.white,
    //           icon: const Icon(Icons.close),
    //           onPressed: () => Get.back(),
    //         ),
    //       ),
    //     ],
    //   ),
    //   content: ,
    // );
  }
}
