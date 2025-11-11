import 'package:flutter/material.dart';

enum HeaderType {
  UserIconOnly,
  WorkspaceAndUserIcons,
}

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final HeaderType type;
  final String? workspaceId;
  final String? workspaceName;
  final String? workspaceImageUrl;

  const CustomHeader({
    super.key,
    required this.type,
    this.workspaceId,
    this.workspaceName,
    this.workspaceImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Disables the back button
      title: _buildTitle(),
      actions: [
        _buildUserMenu(context),
        const SizedBox(width: 10),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black87,
    );
  }

  Widget _buildTitle() {
    switch (type) {
      case HeaderType.WorkspaceAndUserIcons:
        return Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: workspaceImageUrl != null
                  ? NetworkImage(workspaceImageUrl!)
                  : null,
              child: workspaceImageUrl == null
                  ? const Icon(Icons.work)
                  : null,
            ),
            const SizedBox(width: 16),
            Text(
              workspaceName ?? 'Workspace',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        );
      case HeaderType.UserIconOnly:
      default:
        return const Text(
          'Workspaces',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        );
    }
  }

  Widget _buildUserMenu(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'logout') {
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
        }
        if (value == 'settings' && workspaceId != null) {
           Navigator.of(context).pushNamed('/workspace/$workspaceId/settings');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        if (workspaceId != null)
           const PopupMenuItem<String>(
            value: 'settings',
            child: Text('ワークスペース設定'),
          ),
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text('プロフィール'),
        ),
        const PopupMenuItem<String>(
          value: 'executeTx',
          child: Text('送金'),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
      child: const CircleAvatar(
        radius: 20,
        // TODO: Add user image
        child: Icon(Icons.person),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
