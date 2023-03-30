import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class OrdersView extends GetView<HomeController> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: controller.ordersList.isEmpty
            ? Center(
                child: Text('No Orders Found!'),
              )
            : ListView.builder(
                itemCount: controller.ordersList.length,
                itemBuilder: (context, index) {
                  var item = controller.ordersList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                            ),
                            child: item.image == null || item.image!.isEmpty
                                ? Icon(Icons.image_outlined)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(item.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name ?? 'Title',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '£ ${item.price ?? '99.99'}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: item.count == 0
                                ? null
                                : () => controller.updateCounter(false, item),
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 24,
                            child: Text(
                              item.count.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          IconButton(
                            onPressed: () => controller.updateCounter(true, item),
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
