import 'package:flutter_resume_task/model/resume_section_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required List<ResumeSection> sections,
    required String name,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      _$ResumeModelFromJson(json);
}
