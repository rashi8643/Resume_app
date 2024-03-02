import 'package:flutter/material.dart';
import 'package:flutter_resume_task/controller/provider.dart';
import 'package:flutter_resume_task/view/pages/add_resume_page.dart';
import 'package:flutter_resume_task/view/pages/resume_view_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void viewResume(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewResumePage(
              index: index,
            ),
          ));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Resume Builder',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0ab6ab),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final resume = ref.watch(resumeProvider)[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: InkWell(
              onTap: () => viewResume(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white12,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resume.name,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: ref.watch(resumeProvider).length,
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0ab6ab),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddResumePage(),
                ),
              );
            },
            child: const Text(
              'Add Resume',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
