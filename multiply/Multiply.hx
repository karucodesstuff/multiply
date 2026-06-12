package multiply;

import haxe.Rest;

class Multiply {
	/**
	 * Calculates the product of multiple numbers
	 * @param x 
	 * @param y 
	 * @return The product of `x` and the rest of the numbers
	 */
	public static function multiply(x:Int, y:Rest<Int>):Int {
		var i:Int = 0;
		var ret:Int = x;
		while (i < y.length) {
			ret = _multiply(ret, y[i]);
			i++;
		}
		return ret;
	}

	private static function _add(x:Int, y:Int):Int {
		var a:Int;
		var b:Int;
		do {
			a = x & y;
			b = x ^ y;
			x = a << 1;
			y = b;
		} while (a > 0);
		return b;
	}

	private static function _multiply(x:Int, y:Int):Int {
		var result:Int = 0;
		var multiplier:Int = x;
		var multiplicand:Int = y;

		while (multiplicand != 0) {
			if ((multiplicand & 1) != 0) {
				result = _add(result, multiplier);
			}
			multiplier = multiplier << 1;
			multiplicand = multiplicand >>> 1;
		}
		return result;
	}
}
