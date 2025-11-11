import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WorkspaceNewScreen extends StatefulWidget {
  const WorkspaceNewScreen({super.key});

  @override
  State<WorkspaceNewScreen> createState() => _WorkspaceNewScreenState();
}

class _WorkspaceNewScreenState extends State<WorkspaceNewScreen> {
  final _pageController = PageController();

  // Workspace state
  File? _workspaceImageFile;
  final _workspaceNameController = TextEditingController();
  final _workspaceDescriptionController = TextEditingController();

  // Role state
  File? _roleImageFile;
  final _roleNameController = TextEditingController();
  final _roleDescriptionController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _workspaceNameController.dispose();
    _workspaceDescriptionController.dispose();
    _roleNameController.dispose();
    _roleDescriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(Function(File) onImagePicked) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        onImagePicked(File(pickedFile.path));
      });
    }
  }

  Widget _buildImagePicker(File? imageFile, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: imageFile != null ? FileImage(imageFile) : null,
        child: imageFile == null
            ? const Icon(Icons.add_a_photo, size: 40, color: Colors.white)
            : null,
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Workspace'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: [
          _buildWorkspaceForm(),
          _buildRoleForm(),
        ],
      ),
    );
  }

  Widget _buildWorkspaceForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('ワークスペースを新規作成', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  _buildImagePicker(_workspaceImageFile, () => _pickImage((file) => _workspaceImageFile = file)),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _workspaceNameController,
                    decoration: const InputDecoration(labelText: 'Workspace Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _workspaceDescriptionController,
                    decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            child: const Text('次へ'),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('最初のロールを作成', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  _buildImagePicker(_roleImageFile, () => _pickImage((file) => _roleImageFile = file)),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _roleNameController,
                    decoration: const InputDecoration(labelText: 'Role Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _roleDescriptionController,
                    decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                   // TODO: Implement RoleAttributesList and other fields
                  const Text('Responsibilities, Authorities, etc. will go here.'),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            child: const Text('作成'),
          ),
        ],
      ),
    );
  }
}
