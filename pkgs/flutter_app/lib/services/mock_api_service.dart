import '../models/workspace.dart';

class MockApiService {
  Future<List<Workspace>> getWorkspaces() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      Workspace(id: '1', name: 'Workspace Alpha', imageUrl: 'https://via.placeholder.com/150'),
      Workspace(id: '2', name: 'Project Beta', imageUrl: 'https://via.placeholder.com/150'),
      Workspace(id: '3', name: 'Team Gamma', imageUrl: 'https://via.placeholder.com/150'),
    ];
  }
}
