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
  
  double _calculateFontSize(BoxConstraints constraints,
      {double minFontSize = 12, double maxFontSize = 16}) {
    double fontSize = maxFontSize;

    if (constraints.maxWidth < 120) {
      fontSize = minFontSize;
    } else if (constraints.maxWidth < 180) {
      fontSize = maxFontSize - 2;
    }

    return fontSize;
  }


  Widget buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover, width: 200),
        const SizedBox(width: 10),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gameTitle,
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints, minFontSize: 14, maxFontSize: 18),
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('Role: $role',
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints))),
                  const SizedBox(height: 5),
                  Text('$platformTarget',
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints))),
                ],
              );
            },
          ),
        ),
      ],
    );
  }


  Widget buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover, height: 180),
        const SizedBox(height: 10),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gameTitle,
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints, minFontSize: 14, maxFontSize: 18),
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('Role: $role',
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints))),
                  const SizedBox(height: 5),
                  Text('$platformTarget',
                      style: TextStyle(
                          fontSize: _calculateFontSize(constraints))),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}