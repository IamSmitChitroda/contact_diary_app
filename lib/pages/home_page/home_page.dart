import 'package:countact_diary_app/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //============================================================
    ContactController listenable = Provider.of<ContactController>(context);
    ContactController unlistenable =
        Provider.of<ContactController>(context, listen: false);
    //============================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      //============================================================
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: unlistenable.allContacts.isEmpty
            ? const Center(
                child: Text('No Contacts'),
              )
            : GestureDetector(
                child: ListView.separated(
                  itemCount: unlistenable.allContacts.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.route.contactInfoPage,
                        arguments: listenable.allContacts[index],
                      );
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(listenable.allContacts[index].name),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  launchUrl(
                                    Uri(
                                      scheme: 'tel',
                                      path:
                                          listenable.allContacts[index].number,
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.call),
                                label: const Text('Call'),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.route.contactInfoPage,
                                    arguments: listenable.allContacts[index],
                                  );
                                },
                                icon: const Icon(Icons.info),
                                label: const Text('Info'),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text('Edit Contact'),
                                      content: Form(
                                        child: Column(),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                                label: const Text('Edit'),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  listenable.removeContact(
                                    contact: listenable.allContacts[index],
                                  );
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.delete),
                                label: const Text('Delete'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                    title: Text(listenable.allContacts[index].name),
                    subtitle: Text(listenable.allContacts[index].number),
                    leading: CircleAvatar(
                      child: Text(
                        listenable.allContacts[index].name[0].toUpperCase(),
                      ),
                    ),
                    // leading: const Icon(Icons.account_circle),
                    trailing: IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        launchUrl(
                          Uri(
                            scheme: 'tel',
                            path: listenable.allContacts[index].number,
                          ),
                        );
                      },
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
      ),
      //============================================================
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.route.addContactPage);
            },
            child: const Icon(Icons.add_call),
          ),
        ],
      ),
    );
  }
}
