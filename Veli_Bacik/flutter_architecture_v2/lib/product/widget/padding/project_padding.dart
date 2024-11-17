import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets{
  ProjectPadding._() : super.all(0);

  /// ALL Padding
  /// 
  /// [ProjectPadding.allSmall] is 8
  const ProjectPadding.allSmall():super.all(8);

  /// [ProjectPadding.allNormal] is 20
  const ProjectPadding.allNormal():super.all(20);

  /// [ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium():super.all(16);

  /// [ProjectPadding.allLarge] is 32
  const ProjectPadding.allLarge():super.all(32);
}