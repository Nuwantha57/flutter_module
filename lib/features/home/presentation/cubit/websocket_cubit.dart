import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:equatable/equatable.dart';

// States
abstract class WebSocketState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WebSocketInitial extends WebSocketState {}

class WebSocketConnecting extends WebSocketState {}

class WebSocketConnected extends WebSocketState {
  final String message;
  WebSocketConnected(this.message);

  @override
  List<Object?> get props => [message];
}

class WebSocketMessageReceived extends WebSocketState {
  final String message;
  WebSocketMessageReceived(this.message);

  @override
  List<Object?> get props => [message];
}

class WebSocketError extends WebSocketState {
  final String error;
  WebSocketError(this.error);

  @override
  List<Object?> get props => [error];
}

class WebSocketDisconnected extends WebSocketState {}

// Cubit
class WebSocketCubit extends Cubit<WebSocketState> {
  WebSocketChannel? _channel;

  WebSocketCubit() : super(WebSocketInitial());

  void connect() {
    try {
      emit(WebSocketConnecting());

      print('🔌 Attempting to connect to wss://ws.postman-echo.com/raw');

      _channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.postman-echo.com/raw'),
      );

      print('✅ WebSocket channel created');
      emit(WebSocketConnected('Connected to Postman echo server'));

      _channel!.stream.listen(
        (message) {
          print('📩 Received: $message');
          emit(WebSocketMessageReceived(message.toString()));
        },
        onError: (error) {
          print('❌ WebSocket error: $error');
          emit(WebSocketError('Connection error: $error'));
        },
        onDone: () {
          print('🔌 WebSocket connection closed');
          emit(WebSocketDisconnected());
        },
        cancelOnError: false, // Keep listening even after errors
      );
    } catch (e) {
      print('💥 Connection failed: $e');
      emit(WebSocketError('Failed to connect: $e'));
    }
  }

  void sendMessage(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    } else {
      emit(WebSocketError('Not connected'));
    }
  }

  @override
  Future<void> close() {
    _channel?.sink.close();
    return super.close();
  }
}
