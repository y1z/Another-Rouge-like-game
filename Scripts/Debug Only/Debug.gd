class_name Debug extends Node

## class_name Debug


static func d_print(...args: Array) -> void:
	if !OS.is_debug_build(): return;
	print(args)
	pass


static func d_print_rich(... args: Array) -> void:
	if !OS.is_debug_build(): return ;
	print_rich(args)


static func d_printerr(... args: Array) -> void:
	if !OS.is_debug_build(): return ;
	printerr(args)
