import 'package:flutter/material.dart';
import 'package:flutter_resume_task/controller/provider.dart';
import 'package:flutter_resume_task/view/pages/add_resume_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewResumePage extends ConsumerWidget {
  /// The index of the resume to view
  final int index;

  const ViewResumePage({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.read(resumeProvider)[index];

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0ab6ab),
        title: Text(resume.name),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddResumePage(index: index),
                  ),
                );
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(resumeProvider.notifier).removeResume(index);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white12,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Theme.of(context).shadowColor.withAlpha(60)),
              ],
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: resume.sections.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resume.sections[index].title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    resume.sections[index].content,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
