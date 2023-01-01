//stat level end win or loss

class Stats {
  num score, points, minWin, level, duration;

  String status;

  Stats(
      {this.level = 0,
      this.score = 0,
      this.points = 0,
      this.minWin = 0,
      this.duration = 0,
      this.status = "Lost"});
}
