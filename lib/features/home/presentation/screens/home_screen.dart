import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/features/home/presentation/cubit/ble_cubit.dart';
import 'package:flutter_module/features/home/presentation/cubit/wifi_cubit.dart';
import 'package:flutter_module/features/home/presentation/screens/ble_screen.dart';
import 'package:flutter_module/features/home/presentation/screens/wifi_screen.dart';
import 'package:flutter_module/features/payment/data/repositories/payment_repository.dart';
import 'package:flutter_module/services/platform_channel_service.dart';
import '../cubit/home_cubit.dart';
import 'websocket_echo_screen.dart';
import '../../../payment/presentation/cubits/payment_cubit.dart';
import '../../../payment/presentation/screens/payment_screen.dart';
import '../../../../services/payment_api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.blue),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (user) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, ${user.name}!',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow('Email', user.email),
                          _buildInfoRow('User ID', user.userId),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WebSocketEchoScreen(),
                                ),
                              );
                            },
                            child: const Text('Test WebSocket Echo'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // BLE Devices Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => BleCubit(PlatformChannelService()),
                            child: const BleScreen(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.bluetooth),
                    label: const Text('View BLE Devices'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: const Color.fromARGB(255, 128, 228, 186),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Wi-Fi Networks Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => WiFiCubit(PlatformChannelService()),
                            child: const WiFiScreen(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.wifi),
                    label: const Text('View Wi-Fi Networks'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Payment Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => PaymentCubit(
                              PaymentRepository(PaymentApiService()),
                            ),
                            child: const PaymentScreen(
                              amountMinor: 1000, // $10.00
                              currency: 'USD',
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.payment),
                    label: const Text('Pay with Card'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Logout Button
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().logout();
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(message),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
