import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({Key? key, this.desc, required this.status})
      : super(key: key);
  final String? desc;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
            //asset
            Image.asset(
                status
                    ? '$imageAsset/dialog-success.png'
                    : '$imageAsset/dialog-failed.png',
                height: 100),
            const SizedBox(height: 16.0),
            // title
            Text(
              status ? 'Berhasil!' : 'Gagal!',
              style: styleTitle.copyWith(fontSize: setFontSize(22)),
            ),
            // desc
            if (desc != null) ...[
              const SizedBox(height: 16.0),
              Text(
                desc ?? "",
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2F2E41),
                ),
              ),
            ],
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Tutup",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
