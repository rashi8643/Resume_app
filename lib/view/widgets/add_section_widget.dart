import 'package:flutter/material.dart';

class AddSectionWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final VoidCallback onDeletePressed;
  final VoidCallback onUpPressed;
  final VoidCallback onDownPressed;
  const AddSectionWidget({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.onDeletePressed,
    required this.onUpPressed,
    required this.onDownPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).shadowColor.withAlpha(60)),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color:
                          Color.fromARGB(255, 230, 221, 221).withOpacity(.30))),
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                  hintText: 'Enter title here...',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Content',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 230, 221, 221)
                          .withOpacity(.30))),
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                  hintText: 'Enter content here...',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Color.fromARGB(255, 230, 221, 221),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_downward_outlined,
                        color: Color.fromARGB(255, 230, 221, 221),
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 230, 221, 221),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
