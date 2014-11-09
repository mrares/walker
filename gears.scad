
module wheel_gear() {
	translate(wheel_center) translate([0,0, 
		wheel_height + gear_offset]) {
		difference() {
			cylinder(h=gear_thick, r=wheel_gear_dia/2);
			cylinder(h=gear_thick, r=wheel_shaft_dia/2 + 2);
		}
	}
}

module motor_gear() {
	translate(motor_center) translate([0,0, 
		wheel_height + gear_offset + wheel_offset + wheel_guard]) {
		difference() {
			cylinder(h=gear_thick, r=motor_gear_dia/2);
			cylinder(h=gear_thick, r=motor_shaft_dia/2 + 1);
		}
	}
}