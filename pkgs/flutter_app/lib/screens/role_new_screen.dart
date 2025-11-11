import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/role_form.dart';

class RoleNewScreen extends StatefulWidget {
  const RoleNewScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  State<RoleNewScreen> createState() => _RoleNewScreenState();
}

class _RoleNewScreenState extends State<RoleNewScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
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
        title: const Text('New Role'),
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
                // TODO: Implement create logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text('Create'),
            ),
          ),
        ],
      ),
    );
  }
}
