extends Node

enum GridAttribute
{
	NONE = 0,
	PLACE_HOLDER1 = (1 << 0),
	PLACE_HOLDER2 = (1 << 1),
	PLACE_HOLDER3 = (1 << 2),
	PLACE_HOLDER4 = (1 << 3),
	PLACE_HOLDER5 = (1 << 4),
	PLACE_HOLDER6 = (1 << 5),
	PLACE_HOLDER7 = (1 << 6),
}

enum InputResult
{
	NONE = 0,
	UP,
	DOWN,
	RIGHT,
	LEFT,
	MENU,
}
