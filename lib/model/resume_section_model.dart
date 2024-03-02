import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_section_model.freezed.dart';
part 'resume_section_model.g.dart';

@freezed
class ResumeSection with _$ResumeSection {
  factory ResumeSection({
    required String title,
    required String content,
  }) = _ResumeSection;

  factory ResumeSection.fromJson(Map<String, Object?> json) =>
      _$ResumeSectionFromJson(json);
}
