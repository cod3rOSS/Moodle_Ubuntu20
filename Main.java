import java.util.Formatter;
import java.util.Locale;

public class Main {
	public static void main(String[] args) {
		HelloTests test = new HelloTests();
		
		int grade = 0;
		
		// test
		try {
			test.init();
			test.testDoSomethingWithTrivialInput();
			
			grade += 25;
			
		} catch (Exception e) {
			System.out.println(formatOutput("testDoSomethingWithTrivialInput", "25", e));
		}

		// test
		try {
			test.init();
			test.testDoSomethingWithVeryBigInput();
			
			grade += 25;
			
		} catch (Exception e) {
			System.out.println(formatOutput("testDoSomethingWithTrivialInput", "25", e));
		}

		// test
		try {
			test.init();
			test.testDoSomethingElseWithTrivialInput();
			
			grade += 25;
			
		} catch (Exception e) {
			System.out.println(formatOutput("testDoSomethingWithTrivialInput", "25", e));
		}

		// test
		try {
			test.init();
			test.testDoSomethingElseWithManyValuesInput();
			
			grade += 25;
			
		} catch (Exception e) {
			System.out.println(formatOutput("testDoSomethingWithTrivialInput", "25", e));
		}

		System.out.println("Grade :=>> "+grade);
		
	}
	
	
	private static String formatOutput(String testName, String value, Exception e) {
        StringBuilder sb = new StringBuilder();
        try (Formatter f = new Formatter(sb, Locale.getDefault())){
	        String grade = (e == null ? value : "0");
	        f.format("Comment :=>> %s: %s. %s marks\n", testName, (e == null ? "success" : "failure"), grade);
	        if (e != null) {
	            f.format("<|-- \n%s\n --|>\n", e.getMessage());
	        }
	        return sb.toString();
        }
    }
}
