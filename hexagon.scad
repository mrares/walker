module hexagon(d,h)
{
	angle = 360/6;
	cote = d * cot(angle);

	union()
	{
		rotate([0,0,0])
			cube([d,cote,h],center=true);
		rotate([0,0,angle])
			cube([d,cote,h],center=true);
		rotate([0,0,2*angle])
			cube([d,cote,h],center=true);
	}
}

function cot(x)=1/tan(x);
