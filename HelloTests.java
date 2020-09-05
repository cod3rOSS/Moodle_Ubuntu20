
import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.junit.Before;
import org.junit.Test;

public class HelloTests {
	private Hello solution;
	
	@Before
	public void init() throws Exception {
		this.solution = (Hello) Class.forName("HelloSolution").getConstructor().newInstance();
	}
	
	@Test
	public void testDoSomethingWithTrivialInput() {
		double x = 1;
		double y = 1;
		
		assertThat(this.solution.doSomething(x, y))
			.isEqualTo(2.0);
	}
	
	
	@Test
	public void testDoSomethingWithVeryBigInput() {
		double x = Double.MAX_VALUE;
		double y = Double.MAX_VALUE;
		
		assertThat(this.solution.doSomething(x, y))
			.isEqualTo(Double.POSITIVE_INFINITY);
	}
	
	
	@Test
	public void testDoSomethingElseWithTrivialInput() {
		double[] input = {1,2,3,4,5};
		
		assertThat(this.solution.doSomethingElse(input))
			.isEqualTo(15.0);
	}

	@Test
	public void testDoSomethingElseWithManyValuesInput() {
		List<Double> list = IntStream.range(1, 4051).mapToDouble(i->i).mapToObj(i->i).collect(Collectors.toList());
		double[] input = new double[list.size()];
		int index = 0;
		for (double d : list) {
			input[index++] = d;
		}
		
		assertThat(this.solution.doSomethingElse(input))
			.isEqualTo(8203275.0);
	}

}
