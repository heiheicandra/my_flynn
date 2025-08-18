class ProfileStatistic {
  final int applied;
  final int inProgress;
  final int completed;

  ProfileStatistic({
    int? applied,
    int? inProgress,
    int? completed,
  })  : applied = applied ?? 0,
        inProgress = inProgress ?? 0,
        completed = completed ?? 0;
}
