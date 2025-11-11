import 'package:flutter/material.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
        automaticallyImplyLeading: false, // Managed by WorkspaceScaffold
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMemberList(title: '当番リード', memberCount: 3, roleColor: Colors.yellow.shade200),
          const SizedBox(height: 32),
          _buildMemberList(title: 'サポーター', memberCount: 2, roleColor: Colors.blue.shade200),
        ],
      ),
    );
  }

  Widget _buildMemberList({required String title, required int memberCount, required Color roleColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: memberCount,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('User Name (0x123...abc)', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: List.generate(index + 1, (roleIndex) {
                          return Chip(
                            label: Text('Role ${roleIndex + 1}'),
                            backgroundColor: roleColor,
                            padding: EdgeInsets.zero,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 24),
        ),
      ],
    );
  }
}
