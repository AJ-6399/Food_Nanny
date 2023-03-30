import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';
import 'add_item_view.dart';

class MenuView extends GetView<HomeController> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ListTile(
            title: Text('Items'),
            trailing: Icon(
              Icons.add_circle_rounded,
              color: Colors.red,
            ),
            onTap: () => Get.to(() => AddItemView()),
          ),
          Expanded(
            child: controller.itemsList.isEmpty
                ? Center(child: Text('No Items Found!'))
                : GridView.builder(
                    itemCount: controller.itemsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      mainAxisExtent: 280,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.itemsList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Obx(
                                  () => SizedBox(
                                    height: 26,
                                    width: 36,
                                    child: Switch(
                                      value: controller.ordersIdList.contains(item.id),
                                      onChanged: (value) => controller.addToOrders(item, value),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
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
                              SizedBox(height: 16),
                              Text(
                                item.name ?? 'Title',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                ],
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
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
