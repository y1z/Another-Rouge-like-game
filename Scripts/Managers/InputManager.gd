class_name InputMan extends Object

enum States
{
	STARTING_INPUT,
	REAPEATING_INPUT,
}

var state: States = States.STARTING_INPUT
var input_starting_delay: float = Constants.HALF_DELAY
var input_repeat_delay: float = 1.0 / 15.0:
	set(new_daley):
		input_repeat_delay = clampf(new_daley, Constants.MINIMUM_DELAY_BETWEEN_ACTIONS, 9999.0)
	get:
		return input_repeat_delay
var current_starting_time_between_inputs: float = 0.0
var current_repeat_time_between_inputs: float = 0.0
var last_input_result: Enums.InputResult = Enums.InputResult.NONE
var index_of_last_action: int = 0;

var action_and_result: Dictionary[String, Enums.InputResult] = {
	"menu": Enums.InputResult.MENU,
	"move_up": Enums.InputResult.UP,
	"move_down": Enums.InputResult.DOWN,
	"move_right": Enums.InputResult.RIGHT,
	"move_left": Enums.InputResult.LEFT,
	"inventory": Enums.InputResult.INVENTORY,
}


func set_up_delays(delay_between_repeated_inputs: float, starting_input_delay: float) -> void:
	self.input_repeat_delay = delay_between_repeated_inputs
	self.input_starting_delay = starting_input_delay


func handle_input(delta: float) -> Enums.InputResult:
	var result := Enums.InputResult.NONE

	match state:
		States.STARTING_INPUT:
			current_starting_time_between_inputs += delta;
			result = _handle_pressed_action()
			if current_starting_time_between_inputs >= input_starting_delay and result != Enums.InputResult.NONE:
				current_starting_time_between_inputs = 0
				state = States.REAPEATING_INPUT
				last_input_result = result
				Debug.d_print("change state to  States.REAPEATING_INPUT")
			else:
				result = Enums.InputResult.NONE
		States.REAPEATING_INPUT:
			current_repeat_time_between_inputs += delta
			result = _handle_pressed_action()
			if last_input_result != result:
				Debug.d_print("change state to  States.STARTING_INPUT")
				state = States.STARTING_INPUT
				current_repeat_time_between_inputs = 0
				last_input_result = result
			if current_repeat_time_between_inputs > input_repeat_delay:
				current_repeat_time_between_inputs = 0
				return result
			else:
				result = Enums.InputResult.NONE

		_:
			Debug.d_printerr("Case not handled = %s" % state)

	#last_input_result = result
	return result;


## for when you hold a key down
func _handle_repeated_input(repeated_input: Enums.InputResult) -> Enums.InputResult:
	if current_starting_time_between_inputs >= input_repeat_delay:
		current_starting_time_between_inputs = 0;
		return repeated_input

	return Enums.InputResult.NONE


func _handle_pressed_action() -> Enums.InputResult:
	var result: Enums.InputResult = Enums.InputResult.NONE
	index_of_last_action = -1
	for key in action_and_result:
		index_of_last_action += 1;
		if Input.is_action_pressed(key):
			result = action_and_result[key]
			break

	return result


func _has_action_been_released(action_to_check: String) -> bool:
	var result: bool = false;
	result = Input.is_action_just_released(action_to_check)

	return result
