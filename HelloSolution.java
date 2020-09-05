
public class HelloSolution implements Hello {
	@Override
	public double doSomething(double x, double y) {
		return x+y;
	}

	@Override
	public double doSomethingElse(double[] args) {
		double result = 0;
		for (double n : args) {
			result += n;
		}
		return result;
	}
}
