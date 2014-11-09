include <constants.scad>
include <hexagon.scad>

show_motor_box = 1;

module battery_box() {
	translate([0, base_height, 0])
	difference() {
		cube([
			battery_w + wall_thick*2,
			battery_l + wall_thick,
			base_thick + wheel_height + wheel_offset + wheel_guard
		]);

		translate([wall_thick, 0, base_thick])
			cube([
				battery_w,
				battery_l,
				wheel_height + wheel_offset + wheel_guard				
			]);
	}

	translate ([battery_w + wall_thick*2, base_height, 0]) {
		intersection() {
			cylinder(
				h = 	base_thick + wheel_height + wheel_offset + wheel_guard,
				r = (base_width - battery_w - wall_thick*2)
			);
			cube([
				base_width - battery_w - wall_thick*2,
				base_width - battery_w - wall_thick*2,
				base_thick + wheel_height + wheel_offset + wheel_guard
			]);
		}
	}

}

module base() {
		cube([
			base_width,
			base_height,
			base_thick]);
}

module motor_mount_holes() {
	translate (motor_center) translate([0,0,-1 * base_thick]) {
		//Center hole
		cylinder(h=base_thick, d=motor_mount_centerhole_dia);

		translate([motor_mount_holes_dist/2,0,0]) {
			cylinder(h=base_thick, d=motor_mount_holes_dia);
			hexagon(h=base_thick/3, d=motor_mount_holes_dia * 2);

		}
		translate([0,motor_mount_holes_dist/2,0]) {
			cylinder(h=base_thick, d=motor_mount_holes_dia);
			hexagon(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
		translate([-1 * motor_mount_holes_dist/2,0,0]) {
			cylinder(h=base_thick, d=motor_mount_holes_dia);
			hexagon(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
		translate([0,-1 * motor_mount_holes_dist/2,0]) {
			cylinder(h=base_thick, d=motor_mount_holes_dia);
			hexagon(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
	}

}

module base_mounting_holes() {
	
	mount_hole_radius = base_width/2 - 15;
	mount_hole_base_thick = base_thick + wheel_offset;
	
	translate([base_width/2, shaft_offset, 0]) {
		translate([mount_hole_radius, 0, 0]) {
			cylinder(h=base_thick, d=3);
			translate([0,0,2*mount_hole_base_thick/3])
			cylinder(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
		translate([-1 * mount_hole_radius, 0, 0]){
			cylinder(h=base_thick, d=3);
			translate([0,0,2*mount_hole_base_thick/3])
			cylinder(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
		translate([0, mount_hole_radius, 0]){
			cylinder(h=base_thick, d=3);
			translate([0,0,2*mount_hole_base_thick/3])
			cylinder(h=base_thick/3, d=motor_mount_holes_dia * 2);
		}
	}
}

module motor_box() {
	translate ([0, 0, base_thick]) {
		difference () {
			cube([
				base_width,
				base_height,
				wheel_height + wheel_guard + wheel_offset]);

			translate([base_width/2, shaft_offset, 0]) {
				cylinder( h = wheel_height + wheel_guard, d = wheel_dia + 20);
			}

			translate([wall_thick, wheel_dia/2 + shaft_offset + 10 + wall_thick, 0])
			cube([
				base_width - wall_thick * 2,
				base_height,
				wheel_height + wheel_guard
			]);
			if(0)
			difference() {
				translate([wall_thick, 0, 0])
				cube([
					base_width - wall_thick*2,
					base_height,
					40
				]);

				translate([base_width/2, shaft_offset, 0]) {
					cylinder( h = wheel_height + wheel_guard, r = wheel_dia/2 + 10 + wall_thick);
				}	
			}

		}
	}
}

module wheel_shaft() {
	translate (shaft_center) 
		cylinder(h = wheel_shaft_len, r = wheel_shaft_dia/2);
}

module wheel_shaft_hole() {
	translate([base_width/2, shaft_offset, 0])
		cylinder(h=base_thick, r=wheel_shaft_dia/2);
}

module box() {
	echo("Length of the device: ", base_height + base_thick*2 + battery_l );
	echo("Height of the motor box:", wheel_height + wheel_guard + wheel_offset + base_thick);

	difference () {
		union() {
		difference () {
			base();

			// Motor mounting holes
			motor_mount_holes();


			// Space around wheel
			translate([base_width/2, shaft_offset, base_thick + wheel_offset]) {
				cylinder( h = wheel_height + wheel_guard, d = wheel_dia + 20);
			}
		}

		// Wheel offset
		translate([
			base_width/2,
			shaft_offset,
			0])
			cylinder(h=base_thick + wheel_offset + wheel_guard, r=shaft_offset);
		}


		// Wheel center hole
		wheel_shaft_hole();

		// Wheel lock nut
		translate([base_width/2, shaft_offset, 0]) hexagon(d=wheel_shaft_dia*2, h=5);

		//Base mounting holes
		base_mounting_holes();
	}

	if (show_motor_box) {
		motor_box();
	}

	if (show_shaft) {
		//Wheel position
		wheel_shaft();
	}

	if (show_battery_box) {
		battery_box();
	}

}

box();
