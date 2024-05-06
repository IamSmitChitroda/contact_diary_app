import 'package:countact_diary_app/headers.dart';

class ContactInfoPage extends StatelessWidget {
  const ContactInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    Contacts contact = ModalRoute.of(context)!.settings.arguments as Contacts;
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        centerTitle: true,
      ),

      //============================================================
      body: const Padding(
        padding: EdgeInsets.all(16),
      ),

      //============================================================
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'tel',
                      path: contact.number,
                    ),
                  );
                },
                child: const Icon(Icons.call),
              ),
              FloatingActionButton(
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'mailto',
                      path: contact.email,
                    ),
                  );
                },
                child: const Icon(Icons.email),
              ),
              FloatingActionButton(
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'sms',
                      path: contact.number,
                    ),
                  );
                },
                child: const Icon(Icons.message),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.share),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
