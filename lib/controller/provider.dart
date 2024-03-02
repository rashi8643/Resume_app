import 'dart:convert';
import 'dart:developer';

import 'package:flutter_resume_task/model/resume_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'provider.g.dart';

@riverpod
class Resume extends _$Resume {
  @override
  List<ResumeModel> build() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      final keys = sharedPrefs.getKeys();
      final resumeList = <ResumeModel>[];

      for (final key in keys) {
        try {
          resumeList.add(
              ResumeModel.fromJson(jsonDecode(sharedPrefs.getString(key)!)));
        } catch (e) {
          log('Cannot get resume with key : $key');
        }
      }

      state = resumeList;
    });

    return [];
  }

  /// Add new resume
  void addResume(ResumeModel resume) async {
    (await SharedPreferences.getInstance())
        .setString(resume.name, jsonEncode(resume.toJson()));
    state = [...state, resume];
  }
}
