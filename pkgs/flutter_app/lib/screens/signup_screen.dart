import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _userNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _imageFile;
  bool _isUserNameAvailable = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      // Dummy logic for username availability
      final text = _userNameController.text;
      setState(() {
        _isUserNameAvailable = text.isNotEmpty && !text.contains('_');
      });
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 90,
                                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                                child: _imageFile == null
                                    ? const Icon(Icons.person, size: 90, color: Colors.white)
                                    : null,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              if (_imageFile == null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '画像を選択',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextField(
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            hintText: 'ユーザー名',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _userNameController.text.isEmpty
                                ? ''
                                : _isUserNameAvailable
                                    ? 'この名前は利用可能です'
                                    : 'この名前は利用できません',
                            style: TextStyle(
                              fontSize: 12,
                              color: _isUserNameAvailable ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: _descriptionController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: '自己紹介',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _isUserNameAvailable
                    ? () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/workspace', (route) => false)
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
