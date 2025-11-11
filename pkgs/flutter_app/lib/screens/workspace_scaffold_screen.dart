import 'package:flutter/material.dart';
import '../components/sticky_nav.dart';
import 'workspace_detail_screen.dart';
import 'member_screen.dart';
import 'role_screen.dart'; // Import RoleScreen
import 'transaction_screen.dart';
import 'splits_screen.dart';

class WorkspaceScaffoldScreen extends StatefulWidget {
  const WorkspaceScaffoldScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  State<WorkspaceScaffoldScreen> createState() => _WorkspaceScaffoldScreenState();
}

class _WorkspaceScaffoldScreenState extends State<WorkspaceScaffoldScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return WorkspaceDetailScreen(workspaceId: widget.workspaceId);
      case 1:
        return MemberScreen(workspaceId: widget.workspaceId);
      case 2:
        return RoleScreen(workspaceId: widget.workspaceId);
      case 3:
        return SplitsScreen(workspaceId: widget.workspaceId);
      case 4:
        return const TransactionScreen();
      default:
        return Center(
          child: Text('Screen $index not implemented yet'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(_selectedIndex),
      bottomNavigationBar: StickyNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
