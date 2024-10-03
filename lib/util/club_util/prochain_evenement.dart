import 'package:flutter/material.dart';
import 'package:polyapp/util/ept_video.dart';

class ProchainEvenement extends StatefulWidget {
  const ProchainEvenement({super.key});

  @override
  State<ProchainEvenement> createState() => _ProchainEvenementState();
}

class _ProchainEvenementState extends State<ProchainEvenement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EptVideo(
          width: MediaQuery.of(context).size.width / 1.1,
          height: 150,
          invertColors: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: RichText(
              text: const TextSpan(
            text:
                "Lorem ipsum dolor sit amet consectetur. Quis faucibus lacus integer nisi. Aenean amet amet libero duis sollicitudin blandit sed. Molestie arcu ridiculus pellentesque eu sit sed. Felis libero lorem sed .",
            style: TextStyle(
                fontFamily: "InterLight",
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )),
        ),
      ],
    );
  }
}
