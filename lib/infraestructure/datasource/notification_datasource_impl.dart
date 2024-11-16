import 'package:app_missing/domain/datasource/notification_datasource.dart';
import 'package:web_socket_channel/io.dart';

class NotificationDatasourceImpl extends NotificationDatasource
{
  IOWebSocketChannel? _channel;
  
  NotificationDatasourceImpl();

  @override
  void connect(String token) {
    final uri = Uri.parse("ws://192.168.0.9:5000/api/v1/notification/socket?token=$token");
    _channel = IOWebSocketChannel.connect(uri);

    // Escuchar mensajes
    _channel!.stream.listen(
      (message) {
        
      },
      // ignore: avoid_print
      onDone: () => print("Conexión WebSocket cerrada"),
      // ignore: avoid_print
      onError: (error) => print("Error en WebSocket: $error"),
    );
  }
  
  // Agrega un getter para acceder al canal desde fuera
  Stream get stream => _channel!.stream;

  @override
  void disconnect() {
    _channel?.sink.close();
  }
}