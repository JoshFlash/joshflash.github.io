import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';


class GameCard extends StatelessWidget {
  final String imageUrl;
  final String link;
  final String gameTitle;
  final String role;
  final String? platformTarget;
  final bool isVertical;

  const GameCard({
    Key? key,
    required this.imageUrl,
    required this.link,
    required this.gameTitle,
    required this.role,
    required this.platformTarget,
    required this.isVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () async {
          Uri linkUri = Uri.parse(link);
          if (await canLaunchUrl(linkUri)) {
            await launchUrl(linkUri);
          } else {
            await ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not launch $link'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isVertical
              ? buildVerticalLayout()
              : buildHorizontalLayout(),
        ),
      ),
    );
  }

  Widget buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover, width: 200),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(gameTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), minFontSize: 16, maxFontSize: 20),
              const SizedBox(height: 5),
              AutoSizeText('Role: $role', style: const TextStyle(fontSize: 16), minFontSize: 12, maxFontSize: 16),
              const SizedBox(height: 5),
              AutoSizeText('$platformTarget', style: const TextStyle(fontSize: 16), minFontSize: 12, maxFontSize: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover, height: 120),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(gameTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), minFontSize: 12, maxFontSize: 16),
            const SizedBox(width: 5),
            AutoSizeText('Role: $role', style: const TextStyle(fontSize: 16), minFontSize: 12, maxFontSize: 16),
            const SizedBox(width: 5),
            AutoSizeText('$platformTarget', style: const TextStyle(fontSize: 16), minFontSize: 12, maxFontSize: 16),
          ],
        ),
      ],
    );
  }
}
