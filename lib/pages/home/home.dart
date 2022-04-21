import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfilePhoto(),
          const SizedBox(height: 10),
          _buildPhotosSection(),
          const SizedBox(height: 30),
          Expanded(child: _buildProfileInfo()),
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor: Colors.transparent,
        color: Colors.grey[200]!,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.change_circle, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {},
      ),
    );
  }

  Widget _buildProfilePhoto() => Stack(
        children: [
          // Profile photo
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/photo.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          // Metoospace text
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Metoospace',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          // This user has rented
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline_rounded),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'This user has rented',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildPhotosSection() {
    return SizedBox(
      height: 75,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              stops: [
                0.7,
                1.0
              ]).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _roundedSquareImage('assets/images/thumb1.png'),
            const SizedBox(width: 10),
            _roundedSquareImage('assets/images/thumb2.png'),
            const SizedBox(width: 10),
            _roundedSquareImage('assets/images/thumb3.png'),
            const SizedBox(width: 10),
            _roundedSquareImage('assets/images/thumb4.png'),
            const SizedBox(width: 10),
            _roundedSquareImage('assets/images/thumb5.png'),
            const SizedBox(width: 10),
            _roundedSquareImage('assets/images/thumb6.png'),
          ],
        ),
      ),
    );
  }

  Widget _roundedSquareImage(String src) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        src,
        width: 75,
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        // Name, age and joined date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Dave / ',
                    style: Theme.of(context).textTheme.headline6,
                    children: const [
                  TextSpan(
                    text: '26 yo',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ])),
            const Text('Joined at April 12, 2018',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
        // City and buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Live in Italia / Milan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(children: [
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ]),
          ],
        ),
        const SizedBox(height: 10),
        // Bio
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [
                  0.4,
                  1.0
                ]).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: const Text(
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's '''
              '''standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '''
              '''It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in '''
              '''It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in '''
              '''the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus '''
              '''standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '''
              '''PageMaker including versions of Lorem Ipsum.'''),
        ),
        TextButton(
          style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          child: const Text(
            'read more',
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
