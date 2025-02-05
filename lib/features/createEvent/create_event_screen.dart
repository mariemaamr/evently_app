import 'package:evently/core/themes/app_colors.dart';
import 'package:evently/features/createEvent/widget/event_widget.dart';
import 'package:evently/main.dart';
import 'package:evently/models/event.dart';
import 'package:evently/services/firestore_services.dart';
import 'package:evently/services/snack_bar_serv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedCategory = 'Book Club';
  String imagePath = 'assets/images/book.png';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      switch (category) {
        case 'Sport':
          imagePath = 'assets/images/sport_create.png';
          break;
        case 'Birthday':
          imagePath = 'assets/images/birthday.png';
          break;
        default:
          imagePath = 'assets/images/book.png';
      }
    });
  }

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  String formatDate(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Create Event',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 22),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                EventCategorySelector(
                  selectedCategory: selectedCategory,
                  onCategorySelected: selectCategory,
                ),
                SizedBox(height: 20),

                Text("Title",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Event Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Description Input
                Text("Description",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Event Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Date and Time Picker
                ListTile(
                  leading: Icon(Icons.calendar_month_outlined),
                  title: Text('Event Date'),
                  trailing: Text(
                    selectedDate != null
                        ? formatDate(selectedDate!)
                        : 'Choose Date',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  onTap: pickDate,
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('Event Time'),
                  trailing: Text(
                    selectedTime != null
                        ? formatTime(selectedTime!)
                        : 'Choose Time',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  onTap: pickTime,
                ),
                SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.location_searching_outlined,
                        color: AppColors.primaryColor),
                    title: Text('Choose Event Location',
                        style: TextStyle(color: AppColors.primaryColor)),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: AppColors.primaryColor),
                    onTap: () {
                      // Handle location selection
                    },
                  ),
                ),
                SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (selectedDate != null && selectedTime != null) {
                          EasyLoading.show();
                          var data = Event(
                            title: titleController.text,
                            description: descriptionController.text,
                            image: imagePath,
                            category: selectedCategory,
                            dateTime: selectedDate ?? DateTime.now(),
                            time: selectedTime!,
                          );

                          FireStoreServices.createNewEvent(data).then((value) {
                            EasyLoading.dismiss();
                            if (value == true) {
                              navigatorKey.currentState!.pop();
                              SnackBarService.showSuccessMessage(
                                  "Event was successfully created");
                            } else {
                              SnackBarService.showErrorMessage(
                                  "Event creation failed");
                            }
                          });
                        } else {
                          EasyLoading.dismiss();
                          SnackBarService.showErrorMessage(
                              "You must select Event Date & Event Time");
                        }
                      }
                    },
                    child: Text('Add Event',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
