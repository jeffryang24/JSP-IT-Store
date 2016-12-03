<%@ page import="java.util.regex.*" %>
<%!
boolean isAlphaNumeric(String strIn){
	for(int i=0;i<strIn.length();i++){
		char c = strIn.charAt(i);
		if (!Character.isDigit(c) && !Character.isLetter(c)){
			return false;
		}
	}
	
	return true;
}

boolean isNumeric(String strIn){
	for(int i=0;i<strIn.length();i++){
		char c = strIn.charAt(i);
		if (!Character.isDigit(c)){
			return false;
		}
	}
	
	return true;
}

boolean isFullnameValid(String strIn){
	for(int i=0;i<strIn.length();i++){
		char c = strIn.charAt(i);
		if (c == ' ') continue;	// ignore space
		if (!Character.isLetter(c)){
			return false;
		}
	}
	
	return true;
}

boolean isValidEmail(String emailIn){
	Pattern emailPtn = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	Matcher emailMatch = emailPtn.matcher(emailIn);
	return emailMatch.matches();
}
%>