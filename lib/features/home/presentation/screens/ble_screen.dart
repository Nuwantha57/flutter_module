import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/features/ble/domain/entities/ble_device.dart';
import 'package:flutter_module/features/home/presentation/cubit/ble_cubit.dart';
import 'package:flutter_module/features/home/presentation/cubit/ble_state.dart';

class BleScreen extends StatefulWidget {
  const BleScreen({Key? key}) : super(key: key);

  @override
  State<BleScreen> createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  @override
  void initState() {
    super.initState();
    // Load saved devices when screen opens
    context.read<BleCubit>().loadSavedDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE Devices'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocConsumer<BleCubit, BleState>(
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
            scanning: (devices) => _buildScanningView(context, devices),
            loaded: (devices) => _buildLoadedView(context, devices),
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
          Icon(Icons.bluetooth_searching, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No devices found',
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

  Widget _buildScanningView(BuildContext context, List<BleDevice> devices) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue[50],
          child: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Text(
                'Scanning for BLE devices...',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: devices.isEmpty
              ? const Center(child: Text('No devices found yet'))
              : _buildDeviceList(devices),
        ),
      ],
    );
  }

  Widget _buildLoadedView(BuildContext context, List<BleDevice> devices) {
    if (devices.isEmpty) {
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
                'Found ${devices.length} device${devices.length == 1 ? '' : 's'}',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _buildDeviceList(devices)),
      ],
    );
  }

  Widget _buildDeviceList(List<BleDevice> devices) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return _buildDeviceCard(device);
      },
    );
  }

  Widget _buildDeviceCard(BleDevice device) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getSignalColor(device.rssi),
          child: const Icon(Icons.bluetooth, color: Colors.white),
        ),
        title: Text(
          device.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Address: ${device.address}'),
            Text('Signal: ${device.rssi} dBm (${device.signalStrength})'),
            Text('Last seen: ${device.formattedLastSeen}'),
          ],
        ),
        isThreeLine: true,
        trailing: _buildSignalBars(device.rssi),
      ),
    );
  }

  Widget _buildSignalBars(int rssi) {
    final strength = _getSignalStrength(rssi);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          width: 4,
          height: 8.0 + (index * 4),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: index < strength ? _getSignalColor(rssi) : Colors.grey[300],
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  int _getSignalStrength(int rssi) {
    if (rssi >= -50) return 5;
    if (rssi >= -60) return 4;
    if (rssi >= -70) return 3;
    if (rssi >= -80) return 2;
    return 1;
  }

  Color _getSignalColor(int rssi) {
    if (rssi >= -50) return Colors.green;
    if (rssi >= -60) return Colors.lightGreen;
    if (rssi >= -70) return Colors.orange;
    return Colors.red;
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
    return BlocBuilder<BleCubit, BleState>(
      builder: (context, state) {
        return state.maybeWhen(
          scanning: (_) => FloatingActionButton.extended(
            onPressed: () => context.read<BleCubit>().stopScan(),
            icon: const Icon(Icons.stop),
            label: const Text('Stop Scan'),
            backgroundColor: Colors.red,
          ),
          orElse: () => FloatingActionButton.extended(
            onPressed: () => context.read<BleCubit>().startScan(),
            icon: const Icon(Icons.search),
            label: const Text('Scan'),
            backgroundColor: Colors.blueAccent,
          ),
        );
      },
    );
  }
}
