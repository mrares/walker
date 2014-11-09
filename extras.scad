include <gears.scad>

module wheel() {
	translate (wheel_center) {
		difference() {
			cylinder(h = wheel_height, r = wheel_dia/2);
			cylinder(h = wheel_height, r = wheel_shaft_dia/2 + 1); 
		}
	}
}

module motor() {
	translate (motor_center) {
		cylinder( h = motor_len-motor_shaft_len, r = motor_dia/2);
		cylinder( h = motor_len, r=motor_shaft_dia/2);
	}
}

