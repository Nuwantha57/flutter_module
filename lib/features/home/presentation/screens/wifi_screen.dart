import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/features/ble/domain/entities/wifi_network.dart';
import 'package:flutter_module/features/home/presentation/cubit/wifi_cubit.dart';
import 'package:flutter_module/features/home/presentation/cubit/wifi_state.dart';

class WiFiScreen extends StatefulWidget {
  const WiFiScreen({super.key});

  @override
  State<WiFiScreen> createState() => _WiFiScreenState();
}

class _WiFiScreenState extends State<WiFiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WiFiCubit>().loadSavedNetworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wi-Fi Networks'),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<WiFiCubit, WiFiState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => _buildInitialView(context),
            scanning: (networks) => _buildScanningView(context, networks),
            loaded: (networks) => _buildLoadedView(context, networks),
            error: (message) => _buildErrorView(context, message),
          );
        },
      ),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildInitialView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_find, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No networks found',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the scan button to start',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildScanningView(BuildContext context, List<WiFiNetwork> networks) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.green[50],
          child: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Text(
                'Scanning for Wi-Fi networks...',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: networks.isEmpty
              ? const Center(child: Text('No networks found yet'))
              : _buildNetworkList(networks),
        ),
      ],
    );
  }

  Widget _buildLoadedView(BuildContext context, List<WiFiNetwork> networks) {
    if (networks.isEmpty) {
      return _buildInitialView(context);
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.green[50],
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green[700]),
              const SizedBox(width: 12),
              Text(
                'Found ${networks.length} network${networks.length == 1 ? '' : 's'}',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _buildNetworkList(networks)),
      ],
    );
  }

  Widget _buildNetworkList(List<WiFiNetwork> networks) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: networks.length,
      itemBuilder: (context, index) {
        final network = networks[index];
        return _buildNetworkCard(network);
      },
    );
  }

  Widget _buildNetworkCard(WiFiNetwork network) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getSignalColor(network.signalLevel),
          child: Icon(
            _getSecurityIcon(network.securityType),
            color: Colors.white,
          ),
        ),
        title: Text(
          network.ssid,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('BSSID: ${network.bssid}'),
            Text('Security: ${network.securityType}'),
            Text('Band: ${network.frequencyBand}'),
            Text('Signal: ${network.signalStrength}'),
          ],
        ),
        isThreeLine: true,
        trailing: _buildSignalBars(network.signalLevel),
      ),
    );
  }

  Widget _buildSignalBars(int level) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          width: 4,
          height: 8.0 + (index * 4),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: index < level ? _getSignalColor(level) : Colors.grey[300],
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  Color _getSignalColor(int level) {
    if (level >= 4) return Colors.green;
    if (level >= 3) return Colors.lightGreen;
    if (level >= 2) return Colors.orange;
    return Colors.red;
  }

  IconData _getSecurityIcon(String securityType) {
    if (securityType == 'Open') return Icons.wifi;
    return Icons.lock;
  }

  Widget _buildErrorView(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Error', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildFab(BuildContext context) {
    return BlocBuilder<WiFiCubit, WiFiState>(
      builder: (context, state) {
        return state.maybeWhen(
          scanning: (_) => FloatingActionButton.extended(
            onPressed: () => context.read<WiFiCubit>().stopScan(),
            icon: const Icon(Icons.stop),
            label: const Text('Stop Scan'),
            backgroundColor: Colors.red,
          ),
          orElse: () => FloatingActionButton.extended(
            onPressed: () => context.read<WiFiCubit>().startScan(),
            icon: const Icon(Icons.search),
            label: const Text('Scan'),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}
