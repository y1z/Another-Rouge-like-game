class_name InputMan extends Object


var input_repeat_dalay:float = Constants.MINIMUM_DELAY_BETWEEN_ACTIONS
var current_time_between_inputs:float = 0.0
var last_input_result :Enums.InputResult = Enums.InputResult.NONE


func handle_input(delta:float) -> Enums.InputResult :
	var result:Enums.InputResult = Enums.InputResult.NONE
	current_time_between_inputs += delta;
	
	
	return result;
