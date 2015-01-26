include <MCAD/units.scad>
use <MCAD/nuts_and_bolts.scad>;

use <Measurement.scad>
use <write.scad>

view="top";

module wing_body(dodim)
{
    cube([4,75,60]);
    if (dodim==1){
        translate([0,75,62]) rotate([0,0,90+180]) measurement("horizontal","top",55,"M2");
       // translate([10,65,62]) rotate([0,0,90]) measurement("horizontal","front",10,"M3");
        translate([0,20,10]) rotate([0,0,0]) measuremeant("vertical","front",10,"M3");
       }
}

module wing_cuts()
{
    translate([-.1,62,10]) rotate([0,90,0]) boltHole(5,length=12);
    translate([-.1,32,10]) rotate([0,90,0]) boltHole(5,length=12);
    translate([-.1,62,50]) rotate([0,90,0]) boltHole(5,length=12);
    translate([-.1,32,50]) rotate([0,90,0]) boltHole(5,length=12);


}

module wing(dodim)
{
	difference(){
         wing_body(dodim);
         wing_cuts();
         }
}


module bracket_body()
{
     rotate([0,0,60])      wing(0);
     rotate([0,0,60+270])  wing(1);
     translate([12,14,0]) rotate([0,0,90+15])  cube([4,24,60]);
     translate([12-24,3,65]) rotate([0,0,15]) measurement("horizontal","top",26.3,"M1");
     translate([12-30,3,65]) rotate([0,0,60]) measurement("horizontal","top",0,"60deg");
     
      
}

module bracket_cuts()
{
	translate([18,10-15,-.1]) rotate([0,0,90+15])  cube([20,28,60.2]);
    translate([0,10.8,10]) rotate([90,0,15+180]) boltHole(5,length=12);
    translate([0,10.8,50]) rotate([90,0,15+180]) boltHole(5,length=12);  
}

module bracket()
{
	difference(){
          bracket_body();
          bracket_cuts();
          }

}

bracket();
//%translate([150,0,0]) rotate([0,0,90])  bracket();
