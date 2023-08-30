import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '第',
                  style: TextStyle(fontSize: 20),
                ),
                TextSpan(
                  text: '24',
                  style: TextStyle(fontSize: 25),
                ),
                TextSpan(
                  text: '回 ',
                  style: TextStyle(fontSize: 20),
                ),
                TextSpan(
                  text: ' 矢上祭',
                  style: TextStyle(fontSize: 23),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                const TextSpan(
                  text: '『 ',
                  style: TextStyle(fontSize: 25),
                ),
                TextSpan(
                  text: ' Next Stage ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 8,
                  ),
                ),
                const TextSpan(
                  text: ' 』',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '9 ',
                  style: TextStyle(fontSize: 30),
                ),
                TextSpan(
                  text: '月 ',
                  style: TextStyle(fontSize: 18),
                ),
                TextSpan(
                  text: '23 ',
                  style: TextStyle(fontSize: 30),
                ),
                TextSpan(
                  text: '日',
                  style: TextStyle(fontSize: 18),
                ),
                TextSpan(
                  text: ' (土) ',
                  style: TextStyle(fontSize: 15),
                ),
                TextSpan(
                  text: ' 10:00-',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '9 ',
                  style: TextStyle(fontSize: 30),
                ),
                TextSpan(
                  text: '月 ',
                  style: TextStyle(fontSize: 18),
                ),
                TextSpan(
                  text: '24 ',
                  style: TextStyle(fontSize: 30),
                ),
                TextSpan(
                  text: '日',
                  style: TextStyle(fontSize: 18),
                ),
                TextSpan(
                  text: ' (日) ',
                  style: TextStyle(fontSize: 15),
                ),
                TextSpan(
                  text: ' 10:00-',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(width: 5),
              Text(
                '慶應義塾大学 矢上キャンパス',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
