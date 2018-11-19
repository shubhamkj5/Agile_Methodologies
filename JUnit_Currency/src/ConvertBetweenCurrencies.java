import java.util.Scanner;

public class ConvertBetweenCurrencies {
	
	static // Partial Product Skeleton Code
	
	double convertCurrency (double exchangeRate, double amountUSD )  throws ConvertBetweenCurrenciesExceptionHandler{
		
		// This method converts US dollar values to Euro values based on the 
		// current exchange rate between U.S. dollars and and the Euro.
		// On successful conversion, the Euro amount is returned.
		
		// Additional Requirement - Define your own exception handler to
		// handle any invalid values.
		
		//throw new ConvertBetweenCurrenciesExceptionHandler("Product code not yet written");
		double  value;
		if(exchangeRate <=0 )
		{
			throw new ConvertBetweenCurrenciesExceptionHandler("Invalid exchange rate");
		}
		else if(exchangeRate >= Double.MAX_VALUE)
		{
			throw new ConvertBetweenCurrenciesExceptionHandler("Too large value");
		}
		else if(exchangeRate <= Double.MIN_VALUE)
		{
			throw new ConvertBetweenCurrenciesExceptionHandler("Invalid exchange rate");
		}
		else
		{
			value = Math.round((exchangeRate*amountUSD)*100D)/100D;
		}
		return value;
	}
}
