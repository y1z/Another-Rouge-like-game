class_name Constants extends RefCounted

#region  UNIVERSAL CONSTANTS

const INT8_MAX: int = 127
const INT16_MAX: int = 32767
const INT32_MAX: int = 2147483647
const INT64_MAX: int = 9223372036854775807

const INT8_MIN: int = -128
const INT16_MIN: int = -32768
const INT32_MIN: int = -2147483648
const INT64_MIN: int = -9223372036854775808

## Alias to the biggest available constant value 
const INT_MAX: int = INT64_MAX
## Alias to the lowest available constant value 
const INT_MIN: int = INT64_MAX

const FLOAT64_MAX: float = 1.79769e308
const FLOAT64_MIN: float = -1.79769e308

const FLOAT32_MAX: float = 3.402823e+38 
const FLOAT32_MIN: float = 1.175494e-38

#endregion


#region PROJECT CONSTANTS

const MINIMUM_DELAY_BETWEEN_ACTIONS:float = 1.0 / 60
const HALF_DELAY:float = MINIMUM_DELAY_BETWEEN_ACTIONS * 2.0

#endregion
