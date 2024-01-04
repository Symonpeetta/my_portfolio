import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Container BuildNavIcon(int socialNumber, String url) {
    void launchSocialMediaUrl() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      padding: EdgeInsets.all(3.0),
      child: TextButton(
        onPressed: () {
          launchSocialMediaUrl();
        },
        child: Image(
          image: AssetImage('images/social$socialNumber.png'),
        ),
      ),
    );
  }

  SizedBox BuildSixedBox() {
    return SizedBox(
      height: 10.0,
      width: 1000.0,
      child: Divider(
        color: Color.fromRGBO(8, 64, 86, 1),
      ),
    );
  }

  Stack BuildStack(int iconNumber, String text, Color color) {
    return Stack(
      children: <Widget>[
        // Bottom widget
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: color,
            width: 150.0,
            height: 180.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Image(
                image: AssetImage('images/icon$iconNumber.png'),
              ),
            ),
          ),
        ),
        // Top widget
        Positioned(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Vollkorn',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(53, 150, 210, 1),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/nicebg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              // Container for the top of the portfolio conetent
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Title(
                      color: Colors.white,
                      child: Text(
                        'Phasmod',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 30.0,
                          color: const Color.fromRGBO(8, 64, 86, 1),
                        ),
                      ),
                    ),
                  ),

                  //Squeeze later to class Build widget
                  //Wrap Textbutton to each image

                  Row(
                    children: <Widget>[
                      BuildNavIcon(1, 'https://discord.gg/Nu5cqv8gjg'),
                      BuildNavIcon(2, 'https://twitter.com/epsilon_dev1'),
                      BuildNavIcon(3, 'https://github.com/symonpeetta'),
                      BuildNavIcon(4, 'https://www.linkedin.com/in/adeniran-peter-474682236'),
                    ],
                  )
                ],
              ),

              //Container for image and description

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi I\'m PHASMOD',
                          style: TextStyle(
                            fontFamily: 'Playfair',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(250, 169, 4, 1),
                          ),
                        ),
                        Text(
                          ' Discord Moderator pro \n fostering community cohesion. \n Blockchain expert and budding Flutter developer \n diving into tech\'s forefront.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Vollkorn',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(8, 64, 86, 1),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(8, 64, 86, 1),
                            ),
                          ),
                          onPressed: () {
                            void _launchEmail(String emailLaunchUri) async {
                              if (await canLaunch(emailLaunchUri)) {
                                await launch(emailLaunchUri);
                              } else {
                                throw 'Could not launch $emailLaunchUri';
                              }
                            }

                            final Uri params = Uri(
                              scheme: 'mailto',
                              path:
                                  'padeniran01@gmail.com', 
                            );
                            final String emailLaunchUri = params.toString();

                            _launchEmail(emailLaunchUri);
                          },
                          child: Text(
                            'Contact Me',
                            style: TextStyle(
                                fontFamily: 'Vollkorn',
                                color: Colors.white,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image(
                        height: 350,
                        width: 400,
                        image: AssetImage('images/man1.png'),
                      ),
                    ),
                  ),
                ],
              ),

              //Build widget for Sizedbox
              BuildSixedBox(),

              Center(
                child: Text(
                  'My Service',
                  style: TextStyle(
                    fontFamily: 'Playfair',
                    fontSize: 25.0,
                    color: Color.fromRGBO(8, 64, 86, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              BuildSixedBox(),

              //Buld widget later
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildStack(
                      1, 'I am a professional\n Web3 expert, with\n a profound knowledge\nof blockchain space. \n Discord wizard', Color.fromRGBO(8, 64, 86, 1)),
                  BuildStack(2, 'An aspiring Flutter\ndeveloper with \na keen interest \nin crafting mobile \nexperiences.', Color.fromRGBO(250, 169, 4, 1)),
                  BuildStack(3, 'I\'m mastering \n Dart framework \nto create engaging, \n for cross-platform\n mobile applications.', Color.fromRGBO(8, 64, 86, 1)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}