import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/features/presentation/views/dashboard_view.dart';

void main() {
  runApp(const FruitHubDashBoard());
}

class FruitHubDashBoard extends StatelessWidget {
  const FruitHubDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
