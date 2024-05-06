import 'package:countact_diary_app/headers.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({super.key});
  Contacts contacts =
      Contacts(name: 'name', number: 'number', email: 'email', photo: 'photo');
  @override
  Widget build(BuildContext context) {
    StepperController listenable = Provider.of<StepperController>(context);
    StepperController unlistenable =
        Provider.of<StepperController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stepper(
          currentStep: listenable.currentStep,
          onStepCancel: unlistenable.onStepCancel,
          onStepContinue: unlistenable.onStepContinue,
          onStepTapped: (int index) => unlistenable.onStepTapped(index: index),
          steps: <Step>[
            //============================================================
            Step(
              title: const Text('Name'),
              subtitle: const Text('Contact Name'),
              isActive: listenable.isActive(0),
              content: Form(
                key: listenable.nameFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    contacts.name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Name',
                  ),
                ),
              ),
            ),
            //============================================================
            Step(
              title: const Text('Number'),
              subtitle: const Text('Contact number'),
              isActive: listenable.isActive(1),
              content: Form(
                key: listenable.numberFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    contacts.number = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Contact number',
                    // keyboardType: TextInputType.phone,
                  ),
                ),
              ),
            ),
            //============================================================
            Step(
              title: const Text('E-mail'),
              subtitle: const Text('Contact E-mail'),
              isActive: listenable.isActive(2),
              content: Form(
                key: listenable.emailFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    contacts.email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter E-mail',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text('Cancel'),
            icon: const Icon(Icons.cancel),
          ),
          const SizedBox(
            width: 10,
          ),
          if (unlistenable.currentStep == 2)
            FloatingActionButton.extended(
              onPressed: () {
                Provider.of<ContactController>(context, listen: false)
                    .addContact(contact: contacts);
                Navigator.pop(context);
              },
              label: const Text('Save'),
              icon: const Icon(Icons.done),
            ),
        ],
      ),
    );
  }
}
