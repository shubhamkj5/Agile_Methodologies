
public class ConvertBetweenCurrenciesExceptionHandler extends Exception {

String message;
	
	public ConvertBetweenCurrenciesExceptionHandler(String errMessage){
		message = errMessage;
	}
	
	public String getMessage() {
		return message;
	}


}

