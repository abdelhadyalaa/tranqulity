import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/home/view.dart';

class CurrentChat extends StatefulWidget {
  final String? title;

  const CurrentChat({super.key, this.title});

  @override
  State<CurrentChat> createState() => _CurrentChatState();
}

class _CurrentChatState extends State<CurrentChat> {
  late TextEditingController titleController;
  late String currentTitle;

  @override
  void initState() {
    super.initState();
    currentTitle = widget.title ?? "New Chat";
    titleController = TextEditingController(text: currentTitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void _showEditTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Edit Title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.red),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppInput(label: "New Title", controller: titleController),
              AppButton(
                text: "Save",
                onPressed: () {
                  setState(() {
                    currentTitle = titleController.text;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(currentTitle),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            onSelected: (value) {
              if (value == 'edit') {
                _showEditTitleDialog(context);
              } else if (value == 'delete') {
                goTo(page: HomeView(),canPop: false);
              }
            },

            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Row(
                  children: [
                    AppImage(image: "edit_title.svg"),
                    SizedBox(width: 10),
                    Text(
                      "Edit Title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    AppImage(image: "delete.svg"),
                    SizedBox(width: 10),

                    Text(
                      "Delete Chat",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 8, end: 28),
        child: Column(
          children: [
            _UserMassage(text: "Hello How are you?"),

            _BotResponse(
              text:
                  "Hello! I'm just a computer program, so I don't have feelings in the same way humans do, but I'm here and ready to assist you. How can I help you today?",
            ),
            _UserMassage(text: "I feel upset"),

            _BotResponse(
              text:
                  "I'm sorry to hear that you're feeling upset. If you'd like, you can share what's on your mind, and I'm here to listen and offer support or guidance if you need it. Remember, it's okay to feel upset sometimes, and it's important to take care of yourself.",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 8.0,
        ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Row(
          children: [
            Expanded(child: AppInput(label: "write your message")),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: AppImage(image: "send.svg"),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserMassage extends StatelessWidget {
  final String text;

  const _UserMassage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsetsDirectional.symmetric(vertical: 16),
        padding: EdgeInsetsDirectional.all(12),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _BotResponse extends StatelessWidget {
  final String text;

  const _BotResponse({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipRRect(
            child: AppImage(image: "suggest.png", height: 36.h, width: 36.w),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x2842431A).withValues(alpha: .10),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsetsDirectional.symmetric(vertical: 16),
            padding: EdgeInsetsDirectional.all(12),
            child: Text(text, style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
