import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/websocket_cubit.dart';

class WebSocketEchoScreen extends StatefulWidget {
  const WebSocketEchoScreen({super.key});

  @override
  State<WebSocketEchoScreen> createState() => _WebSocketEchoScreenState();
}

class _WebSocketEchoScreenState extends State<WebSocketEchoScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage(WebSocketCubit cubit) {
    if (_controller.text.isNotEmpty) {
      cubit.sendMessage(_controller.text);
      setState(() {
        _messages.add('Sent: ${_controller.text}');
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Echo Client'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocProvider(
        create: (context) => WebSocketCubit()..connect(),
        child: BlocConsumer<WebSocketCubit, WebSocketState>(
          listener: (context, state) {
            if (state is WebSocketMessageReceived) {
              setState(() {
                _messages.add('Received: ${state.message}');
              });
            } else if (state is WebSocketError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                // Status indicator
                Container(
                  padding: const EdgeInsets.all(16),
                  color: _getStatusColor(state),
                  child: Row(
                    children: [
                      Icon(_getStatusIcon(state), color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        _getStatusText(state),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Messages list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isSent = message.startsWith('Sent:');
                      return Align(
                        alignment: isSent
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSent ? Colors.blue[100] : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: isSent ? Colors.blue[900] : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Input field
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) =>
                              _sendMessage(context.read<WebSocketCubit>()),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () =>
                            _sendMessage(context.read<WebSocketCubit>()),
                        icon: const Icon(Icons.send),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getStatusColor(WebSocketState state) {
    if (state is WebSocketConnected || state is WebSocketMessageReceived) {
      return Colors.green;
    } else if (state is WebSocketConnecting) {
      return Colors.orange;
    } else if (state is WebSocketError) {
      return Colors.red;
    }
    return Colors.grey;
  }

  IconData _getStatusIcon(WebSocketState state) {
    if (state is WebSocketConnected || state is WebSocketMessageReceived) {
      return Icons.check_circle;
    } else if (state is WebSocketConnecting) {
      return Icons.sync;
    } else if (state is WebSocketError) {
      return Icons.error;
    }
    return Icons.circle;
  }

  String _getStatusText(WebSocketState state) {
    if (state is WebSocketConnected) {
      return state.message;
    } else if (state is WebSocketConnecting) {
      return 'Connecting...';
    } else if (state is WebSocketError) {
      return 'Error';
    } else if (state is WebSocketDisconnected) {
      return 'Disconnected';
    }
    return 'Not connected';
  }
}
