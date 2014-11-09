
show_motor_box = 1;
show_motor_base = 1;
show_battery_box = 1;

show_shaft = 0;
show_extras = 0;

battery_l = 110;
battery_w = 35;
battery_h = 30;

motor_dia = 28;
motor_len = 41;
motor_shaft_len = 10;
motor_shaft_dia = 3;
motor_offset = 40;

motor_mount_centerhole_dia = 10;
motor_mount_holes_dist = 38; //(r = 19)
motor_mount_holes_dia = 3;
motor_mount_thick = 3;

wheel_dia = 56;
wheel_height = 37;
wheel_guard = 3;
wheel_offset = -7;
wheel_shaft_dia = 8;

gear_offset = 2;
gear_thick = 12.7;
wheel_gear_dia = 45;
motor_gear_dia = wheel_gear_dia/2;

wheel_shaft_len = wheel_height + wheel_guard + gear_thick + 10;

base_width = wheel_dia + 10;
base_height = wheel_dia + motor_dia + 40;
base_thick = 12;
wall_thick = 4;

shaft_offset = 10;

wheel_center = [base_width/2, shaft_offset, base_thick + wheel_offset + wheel_guard];
shaft_center = [base_width/2, shaft_offset, base_thick + wheel_offset];
motor_center = [base_width/2, shaft_offset + motor_offset + wheel_dia/2, base_thick];
