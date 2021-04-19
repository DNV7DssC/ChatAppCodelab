import 'package:chat_app/channel_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  final client = StreamChatClient(
    'edr6wu4uwx2r',
    logLevel: Level.INFO,
  );

  // Set the user for the application
  await client.connectUser(
    User(
      id: 'DNV7',
      extraData: {
        'image': 'https://getstream.io/random_png/?id=restless-art-2&amp;name=Restless+art',
      },
    ),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRE5WN0Rzc0MifQ.FUH5tvxAA8Kfecq9d_jz0ujpWRAtEgONpqb0K30SFCw',
  );

  final channel = client.channel('messaging', id: 'flutter_devs');
  channel.watch();
  runApp(MyApp(
    client: client,
    channel: channel,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.client, this.channel}) : super(key: key);

  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(client: client, child: widget);
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}
