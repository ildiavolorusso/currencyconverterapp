class Calculation{
  Calculation({
    required this.sendValue,
    required this.rate
  });

  final double sendValue;
  final double rate;

  double getResult() {
    return sendValue * rate;
  }
}