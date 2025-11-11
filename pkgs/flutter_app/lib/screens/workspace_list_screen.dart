import 'package:flutter/material.dart';
import '../components/custom_header.dart'; // Import the custom header
import '../models/workspace.dart';
import '../services/mock_api_service.dart';

class WorkspaceListScreen extends StatefulWidget {
  const WorkspaceListScreen({super.key});

  @override
  State<WorkspaceListScreen> createState() => _WorkspaceListScreenState();
}

class _WorkspaceListScreenState extends State<WorkspaceListScreen> {
  late Future<List<Workspace>> _workspacesFuture;

  @override
  void initState() {
    super.initState();
    _workspacesFuture = MockApiService().getWorkspaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(type: HeaderType.UserIconOnly), // Use the custom header
      body: FutureBuilder<List<Workspace>>(
        future: _workspacesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No workspaces found.'));
          }

          final workspaces = snapshot.data!;
          return ListView.builder(
            itemCount: workspaces.length,
            itemBuilder: (context, index) {
              final workspace = workspaces[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: workspace.imageUrl != null
                      ? NetworkImage(workspace.imageUrl!)
                      : null,
                  child: workspace.imageUrl == null
                      ? const Icon(Icons.work)
                      : null,
                ),
                title: Text(workspace.name),
                onTap: () {
                  // TODO: Navigate to workspace detail screen
                },
              );
            },
          );
        },
      ),
    );
  }
}
