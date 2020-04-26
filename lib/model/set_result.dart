class SetResult {
  final int _completedReps;
  final int _weight;

  int get completedReps => _completedReps;
  int get weight => _weight;

  SetResult(this._completedReps, this._weight);

  Map<String, dynamic> toJson(){
    return {
      "reps": _completedReps,
      "weight": _weight
    };
  }
}