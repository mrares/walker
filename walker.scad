include <constants.scad>
include <box.scad>
include <gears.scad>

show_motor_box = 1;
show_motor_base = 1;
show_battery_box = 1;

show_shaft = 0;
show_extras = 0;

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


module walker() {
	echo("");
	box();

	if(show_extras) {
		wheel();
		wheel_gear();

		translate([0,0, motor_mount_thick]) motor();
		motor_gear();
	}
}

walker();
echo("");

/**
MOTOR:
Diameter: 27.7mm
Body H : 26mm (exc. mount!)
Body-shaft nut H: ?
Shaft H: 10mm

Total H: 41mm

EST! RPM: 7200



WHEEL:
D: 52-56mm
(Circ): 175mm
H: 36-38mm

pulleys: 
est ratio 1/12.6 reduction