import 'package:cabservice/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/admin_categories_controller.dart';

class AddCategoryDialog extends GetView<AdminCategoriesController> {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return AlertDialog(
      backgroundColor: theme.colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      scrollable: true,
      title: Text('Add New Category'),
      titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      actions: [
        OutlinedButton(
          onPressed: Get.back,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
            side: BorderSide(
              color: theme.colorScheme.primary,
            ),
          ),
          child: Text(
            'Cancel',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: controller.createCategory,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
          ),
          child: Text(
            'Save Category',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
      content: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Fill in the details for the new category.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            SizedBox(height: SizeConfig.defaultSize),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    'Name',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: kDefaultFontSize),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: controller.nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validateName,
                    decoration: InputDecoration(
                      hintText: 'e.g. Transportation',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.colorScheme.outline),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize),
                      ),
                      filled: true,
                      fillColor:
                          theme.colorScheme.outlineVariant.withAlpha(100),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    'Description',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: kDefaultFontSize),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: controller.descController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validateDesc,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Briefly describe the category',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.colorScheme.outline),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize),
                      ),
                      filled: true,
                      fillColor:
                          theme.colorScheme.outlineVariant.withAlpha(100),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    'Status',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: kDefaultFontSize),
                Expanded(
                  flex: 3,
                  child: DropdownButtonFormField2<int>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      filled: true,
                      fillColor:
                          theme.colorScheme.outlineVariant.withAlpha(100),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.colorScheme.outline),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize),
                      ),
                    ),
                    hint: Text(
                      'Select category status',
                      style: theme.textTheme.bodyMedium,
                    ),
                    items: [1, 0]
                        .map((item) => DropdownMenuItem<int>(
                              value: item,
                              child: Text(
                                item == 1 ? 'Active' : 'Inactive',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: controller.validateStatus,
                    onChanged: controller.selectedStatus.call,
                    value: controller.selectedStatus.value,
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: theme.colorScheme.outline,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize),
          ],
        ),
      ),
    );
  }
}
