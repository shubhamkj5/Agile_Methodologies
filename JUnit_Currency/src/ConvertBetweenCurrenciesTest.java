import junit.framework.TestCase;

public class ConvertBetweenCurrenciesTest extends TestCase {

	//EQUIVALENCE___________________________________________ 
	
	
	//	Test no. 1
	//	Objective: Verify exchange rate and USD are positive
	//	Input(s): exchange rate = 1.2, USD = 23
	//	Expected output: 27.6
	public void testconvertCurrency001()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		try
		{
		Double result = test1.convertCurrency(1.2, 23);
		assertEquals(27.6, result);
	} 
	catch (ConvertBetweenCurrenciesExceptionHandler e) {
		fail("Exception not expected");
	}
	}
	
	//	Test no. 2
	//	Objective: Verify exchange rate and USD are negative
	//	Input(s): exchange rate = -1.2, USD = -23
	//	Expected output: Invalid exchange rate
	public void testconvertCurrency002()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		try
		{
			Double result = test1.convertCurrency(-1.2, -23);		
			fail("Exception expected");
			
		} 
		catch (ConvertBetweenCurrenciesExceptionHandler e) {
			assertEquals("Invalid exchange rate", e.getMessage());
		}
	}
	
	
///////////////////////////////////////////////////////////////////////	
	//BOUNDARY VALUE___________________________________________ 
	
	//	Test no. 3
	//	Objective: Verify exchange rate and USD are greater than 0
	//	Input(s): exchange rate = 0.1, USD = 0.1
	//	Expected output: 0.01
	public void testconvertCurrency003()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		try
		{
			Double result = test1.convertCurrency(0.1, 0.1);
			assertEquals(0.01, result);
		} 
		catch (ConvertBetweenCurrenciesExceptionHandler e) {
			fail("Exception not expected");
		}
	}
	
	//	Test no. 4
	//	Objective: Verify exchange rate and USD are 0
	//	Input(s): exchange rate = 0, USD = 0
	//	Expected output: Invalid exchange rate
	public void testconvertCurrency004()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		
		Double result;
		try {
			result = test1.convertCurrency(0, 0);
			fail("Exception expected");
			
		} 
		catch (ConvertBetweenCurrenciesExceptionHandler e) {
			assertEquals("Invalid exchange rate", e.getMessage());
		}		
		
	}
	
	//	Test no. 5
	//	Objective: Verify exchange rate and USD are max
	//	Input(s): exchange rate = Double.MAX_VALUE, USD = Double.MAX_VALUE
	//	Expected output: Too large value
	public void testconvertCurrency005()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		try {
			Double result = test1.convertCurrency(Double.MAX_VALUE, Double.MAX_VALUE);
			fail("Too large value");
		}
		catch(ConvertBetweenCurrenciesExceptionHandler e)
		{
			assertEquals("Too large value", e.getMessage());
		}
	}
	
	//	Test no. 6
	//	Objective: Verify exchange rate and USD are min
	//	Input(s): exchange rate = Double.MIN_VALUE, USD = Double.MIN_VALUE
	//	Expected output: Invalid exchange rate
	public void testconvertCurrency006()
	{
		ConvertBetweenCurrencies test1 = new ConvertBetweenCurrencies();
		try {
			Double result = test1.convertCurrency(Double.MIN_VALUE, Double.MIN_VALUE);
			fail("Exception expected");		
			
		}
		catch(ConvertBetweenCurrenciesExceptionHandler e)
		{
			assertEquals("Invalid exchange rate", e.getMessage());
		}
	}
}
