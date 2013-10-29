/* js file for form validation */
function validate(){
	startDate = document.getElementById('startDate').value;
	endDate = document.getElementById('endDate').value;
	var errorMessage = '';	
	if(startDate == ''){
		errorMessage = errorMessage + 'Enter start date! <br />';
	}	
	else{
		startDate = new Date(startDate);
		if(isNaN(startDate.getDate())){
			errorMessage = errorMessage + 'Enter a valid start date! <br />';
		}
		
	}
	if(endDate == ''){
		errorMessage = errorMessage + 'Enter end date! <br />';
	}
	else{
		endDate = new Date(endDate);
		if(isNaN(endDate.getDate())){
			errorMessage = errorMessage + 'Enter a valid end date! <br />';
		}
	}
	
	if(errorMessage == ''){		
		if(startDate > endDate)
		{
			errorMessage = errorMessage + 'Start date greater than end date! <br />';
			writeError(errorMessage);
			return false;
		}
		else
		{
			return true;
		}
	}
	else{
		writeError(errorMessage);
		return false;
	}
		
}
function writeError(err){
	document.getElementById('errorMessage').innerHTML = '<div class="errorContent">' + err + '</div>';
}