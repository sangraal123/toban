import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roles'),
        automaticallyImplyLeading: false, // Managed by WorkspaceScaffold
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAllRolesSection(context),
              const SizedBox(height: 32),
              _buildMyRolesSection(),
              const SizedBox(height: 32),
              _buildRoleShareSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllRolesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '当番一覧',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 7, // 6 roles + 1 add button
          itemBuilder: (context, index) {
            if (index == 6) {
              return InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/workspace/$workspaceId/role/new',
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.add, size: 40),
                ),
              );
            }
            return Column(
              children: [
                const CircleAvatar(radius: 30, child: Icon(Icons.local_offer)),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    'Role ${index + 1}',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildMyRolesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '担当当番',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2, // Dummy count
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text('My Role Name'),
                subtitle: Text('My Role Description'),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ],
    );
  }

  Widget _buildRoleShareSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ロールシェアの残高',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Dummy count
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.pie_chart)),
                title: const Text('Role Share Name'),
                trailing: Text('${100 - index * 20} Shares'),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ],
    );
  }
}
