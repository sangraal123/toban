import 'dart:io';
import 'package:flutter/material.dart';

class RoleForm extends StatefulWidget {
  const RoleForm({
    super.key,
    required this.imageFile,
    required this.onImageTap,
    required this.nameController,
    required this.descriptionController,
  });

  final File? imageFile;
  final VoidCallback onImageTap;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  @override
  State<RoleForm> createState() => _RoleFormState();
}

class _RoleFormState extends State<RoleForm> {
  List<String> _responsibilities = ['Default responsibility'];
  List<String> _authorities = ['Default authority'];

  Widget _buildAttributeList(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  items.add('');
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: items[index],
                      onChanged: (value) {
                        items[index] = value;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onImageTap,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: widget.imageFile != null ? FileImage(widget.imageFile!) : null,
              child: widget.imageFile == null
                  ? const Icon(Icons.add_a_photo, size: 40, color: Colors.white)
                  : null,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: widget.nameController,
            decoration: const InputDecoration(
              labelText: 'Role Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: widget.descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          _buildAttributeList('Responsibilities', _responsibilities),
          const SizedBox(height: 24),
          _buildAttributeList('Authorities', _authorities),
        ],
      ),
    );
  }
}
