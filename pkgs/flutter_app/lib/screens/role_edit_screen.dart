import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/role_form.dart';

class RoleEditScreen extends StatefulWidget {
  const RoleEditScreen({super.key, required this.workspaceId, required this.roleId});

  final String workspaceId;
  final String roleId;

  @override
  State<RoleEditScreen> createState() => _RoleEditScreenState();
}

class _RoleEditScreenState extends State<RoleEditScreen> {
  final _nameController = TextEditingController(text: 'Dummy Role Name'); // Prefill with existing data
  final _descriptionController = TextEditingController(text: 'Dummy Role Description');
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Role'),
      ),
      body: Column(
        children: [
          Expanded(
            child: RoleForm(
              imageFile: _imageFile,
              onImageTap: _pickImage,
              nameController: _nameController,
              descriptionController: _descriptionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement save logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
