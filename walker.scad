include <constants.scad>
include <box.scad>
include <extras.scad>

show_motor_box = 1;
show_motor_base = 1;
show_battery_box = 1;

show_shaft = 0;
show_extras = 1;


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

