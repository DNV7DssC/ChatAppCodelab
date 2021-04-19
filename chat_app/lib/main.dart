import 'package:chat_app/channelList_page.dart';
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
      id: 'DNV7DssC',
      extraData: {
        'image': 'https://getstream.io/random_png/?id=restless-art-2&amp;name=Restless+art',
      },
    ),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRE5WN0Rzc0MifQ.FUH5tvxAA8Kfecq9d_jz0ujpWRAtEgONpqb0K30SFCw',
  );

  List<Channel> channels = [];
  Channel channel = client.channel('messaging', id: 'flutter_devs', extraData: {
    'members': [client.state.user.id]
  });
  channel.create();
  channel.addMembers([client.state.user.id]);
  print('##################### ' + client.state.user.id + ' ##################### ');
  // channel.watch();
  // channels.add(channel);
  // channel = client.channel('gaming', id: 'gamers');
  // channel.create();
  // channels.add(channel);

  runApp(MyApp(
    client: client,
    channels: channels,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.client, this.channels}) : super(key: key);

  final StreamChatClient client;
  final List<Channel> channels;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, widget) {
          return StreamChat(client: client, child: widget);
        },
        home: ChannelListPage());
  }
}
