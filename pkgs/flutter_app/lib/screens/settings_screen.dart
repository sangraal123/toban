import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspace Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOverviewSection(),
          const SizedBox(height: 32),
          _buildAuthoritiesSection(),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // TODO: Save settings
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('保存'),
          )
        ],
      ),
    );
  }

  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ワークスペースの概要', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.work, size: 40)),
            const SizedBox(width: 24),
            ElevatedButton(onPressed: () {}, child: const Text('画像をアップロード')),
          ],
        ),
        const SizedBox(height: 24),
        const TextField(
          decoration: InputDecoration(labelText: '名前', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: '説明', border: OutlineInputBorder()),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildAuthoritiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ワークスペースの権限', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildAuthoritySubSection(title: '当番の新規作成'),
        const SizedBox(height: 16),
        _buildAuthoritySubSection(title: '当番の割当・休止・剥奪'),
        const SizedBox(height: 16),
        _buildOwnerSubSection(),
      ],
    );
  }

  Widget _buildAuthoritySubSection({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        // Dummy list of authorized users
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Alice'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'ユーザー名 or ウォレットアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('追加')),
          ],
        ),
      ],
    );
  }

  Widget _buildOwnerSubSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('オーナー', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
         Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '新しいオーナーのアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('変更'),
            ),
          ],
        ),
      ],
    );
  }
}
