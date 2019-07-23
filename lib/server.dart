import 'dart:io';

void main() {
  ServerSocket.bind(InternetAddress.anyIPv4, 4567).then(
    (ServerSocket server) {
      server.listen(handleConnection);
    }
  );
}

void handleConnection(Socket client){
  print('Connection from '
    '${client.remoteAddress.address}:${client.remotePort}');

  client.listen((List<int> event) {
    String message = new String.fromCharCodes(event).trim();
    print('Received: $message');
  },
  onError: (error) {
    print(error);
  },
  onDone: () {
    print('done');
  });

  client.write('ok');
}