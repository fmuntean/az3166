$fn=100;

//rotate([90,0,45])endcap();

//color("green")rotate([180,0])endcapv2();
//translate([0,0,27])rotate([0,180,0]) faceplate();
//translate([0,-15,6.6])rotate([0,180])AZ3166Board(true);

use <d:\git\HomeAutomation\3d.prints\WallBox.scad>

//use <D:\git\HomeAutomation\3d.prints\faceplate.scad>

//translate([19.5,-37.5,-3.6])button();

//pcbBox();
translate([0,0,25])boxPlate();

//speakerBox();

//translate([0,0,21])facePlateSupport();
//facePlate();

/*
translate([0,0,41])rotate([90,0])rotate([90,90,0])difference(){facePlate2();
   translate([40,0,0])cube([80,140,20],true);
    //translate([0,-80,0])cube([100,100,20],true);
    //translate([0,95,0])cube([100,100,20],true);
}


translate([0,-25])resetPin();
/*
translate([8.5,-22])scale([0.8,0.8,0.4])resetPin();

translate([-8.5,-22])scale([0.8,0.8,0.4])resetPin();

*/

module speakerBox(){
    difference(){
    //cube([50,50,6],true);
    hull(){cylinder(d=48,h=5);scale([1,2,1])cylinder(d=26,h=5);}
      translate([0,0,-1])cylinder(d=33,h=10);
      translate([0,0,1])cylinder(d=41,h=10);
      rotate([0,0,45])translate([0,20,6])cube([5,60,4],true);
        
    }
    
    
    translate([0,0,10])difference(){hull(){
        cylinder(d=30,h=1.2);
        translate([0,0,0.6])cube([14,73,1.2],true);
    }
    translate([0,0,-1])cylinder(d=20,h=4);
    translate([0,-52/2-5])cylinder(d=2,h=4);
    translate([0,52/2+5])cylinder(d=2,h=4);
    }

}

module boxPlate(){
    difference(){
        cube([132,80,1.2],true);
        cube([50,50,3],true);
        //holes for mounting the pcbBox
        for(i=[-3,-5,-7,0,7,5,3]){
        translate([13*2.54,(i)*2.54,-3])cylinder(d=2,h=10);
        translate([-13*2.54,(i)*2.54,-3])cylinder(d=2,h=10);
        }    
    for(i=[-8,-6,-4,-1,1,4,6,8]){
        translate([12*2.54,(i)*2.54,-3])cylinder(d=2,h=10);
     translate([-12*2.54,(i)*2.54,-3])cylinder(d=2,h=10);}
     
     
     //holes for mounting to wall
     translate([41.1,0,-3])cylinder(d=3.8,h=6);
     translate([-41.1,0,-3])cylinder(d=3.8,h=6);
     
        }
    
    translate([0,0,3])difference(){
        cube([132,80,5],true);
        cube([115,66,8],true);
        }   
    translate([0,0,6])difference(){
        cube([120,70,2],true);
        cube([115,66,4],true);
        }  
    translate([0,0,5.3])difference(){
    union(){translate([60.6,20,0])hull(){cube([3,6,4.5]);translate([-3,0])cube([6,6,1]);}
    translate([60.6,-25,0])hull(){cube([3,6,4.5]);translate([-3,0])cube([6,6,1]);}
    translate([-64,20,0])hull(){cube([3,6,4.5]);cube([6,6,1]);}
    translate([-64,-25,0])hull(){cube([3,6,4.5]);cube([6,6,1]);}
    
     translate([30,-39,0])hull(){cube([10,3,4.5]);cube([10,6,1]);}
     translate([-30,-39,0])hull(){cube([10,3,4.5]);cube([10,6,1]);}
     translate([30,36,0])hull(){cube([10,3,4.5]);translate([0,-3])cube([10,6,1]);}
     translate([-30,36,0])hull(){cube([10,3,4.5]);translate([0,-3])cube([10,6,1]);}
        
    }    
    //snapfit border
    translate([0,0,-5.1])rotate([0,0,90]){translate([-40,64,8])rotate([0,90,0])cylinder(d=3.2,h=80);
    translate([-40,-64,8])rotate([0,90,0])cylinder(d=3.2,h=80);
    translate([-39,-64,8])rotate([-90,0,0])cylinder(d=3.2,h=128);
    translate([39,-64,8])rotate([-90,0,0])cylinder(d=3.2,h=128);
    }

    }

}

module resetPin(){
    difference(){
    cylinder(d=8,h=2.8);
    translate([0,0,0.8])cylinder(d=6,h=3);
        
        }

}

module facePlateSupport(){
    difference(){
    cube([120,70,1],true);
    cube([60,40,2],true);
    
    //mounting holes    
    for(i=[-3,-5,-8,7,5,3]){
        translate([15.5*2.54,(i+0.5)*2.54,-5])cylinder(d=1.6,h=10);
        translate([-15.5*2.54,(i+0.5)*2.5,-5])cylinder(d=1.6,h=10);
    }
    for(i=[-6,-4,2,4]){
        translate([14*2.54,(i+0.5)*2.54,-5])cylinder(d=1.6,h=10);
    translate([-14*2.54,(i+0.5)*2.54,-5])cylinder(d=1.6,h=10);
    }    
    
    //wall mounting holes
    translate([83.4/2,0,-1])cylinder(d=3,h=10);
    translate([-83.4/2,0,-1])cylinder(d=3,h=10);
        
    }
}


module facePlate2(){
        difference(){
       roundedCube2(bottom=[72,126,0],top=[80,130,9], r1=1, rTop=1); //outside shell
       translate([0,0,1.2])roundedCube2(bottom=[69,123,0],top=[80,128,6+7], r1=1, rTop=1); //inside shell
   
    translate([0,-15]){
    translate([0,-77/2+29,-0])cube([30,20,6],true);//cube([26,15,6],true);//oled 
    
     
    //rgbLED
    translate([20.5,-77/2+21,-0.4])cylinder(d=5,h=3);
        
    //btn A
    translate([-26+5,-77/2+38,-1]){cube([8,16,6],true);
    translate([0,-8,-1])cylinder(d=8,h=6);       }
    //btn B
    translate([26-5,-77/2+38,-1]){cube([8,16,6],true);
        translate([0,-8,-1])cylinder(d=8,h=6);       }
        //leds
        translate([-20.5,-77/2+20,2.2]) cube([2,8,6],true);
        
        //reset 
        translate([-24,-77/2+60,-1])cylinder(d=2.2,h=6);
        
        //microphone
        translate([-2,18,-1]) cylinder(d=3,h=6);
        
        //sensors
        for(i=[0:2:6])
            translate([-i*2-10,-30,-1])cube([1.5,4,10]);
        //mounting holes
       //translate([0,83.4/2-10,-1])cylinder(d1=10,d2=4,h=1.1);
    //    translate([0,-83.4/2-10,-1])cylinder(d1=10,d2=4,h=1.1);
    }

   
    }//difference
    
    translate([0,-15]){
    //reset 
    translate([-24,-77/2+60,0])difference(){
        cylinder(d=5,h=2);cylinder(d=2.2,h=6);}
    
    //btn A
    translate([-26+5,-77/2+38,-0.6]){cube([6,16,0.8],true); translate([0,-8,-0.4])cylinder(d1=6,d2=7.5,h=2);       }  
    //btn B
    translate([26-5,-77/2+38,-0.6]){cube([6,16,0.8],true);
     translate([0,-8,-0.4])cylinder(d1=6,d2=7.5,h=2);       }
    
     //oled support    
    translate([0,-77/2+29,-0.2])rotate([0,180])intersection(){
        translate([0,0,-1.2])cube([30,20,4],true);
        translate([0,0,-1])difference(){
        roundedCube2(bottom=[27,16,0],top=[30,20,4], r1=2, rTop=2); //outside shell
       translate([0,0,-0.4])roundedCube2(bottom=[25,14,0],top=[30,20,4], r1=1, rTop=1); //inside shell    
        cube([26,15,6],true);//oled
    }
}
    //board wall under the sensors
    translate([0,-77/2+7,2.5])cube([52,2,5],true);
    translate([52/2,-10,0])difference(){cube([10,20,6.6]); translate([5,10])cylinder(d=3,h=10);}
    translate([-52/2-10,-10,0])difference(){cube([10,20,6.6]); translate([5,10])cylinder(d=3,h=10);}
     //mounting holes posts
} //translate([0,83.4/2-10,0])difference(){cylinder(d2=8,d1=14,h=10);cylinder(d=4.3,h=12);}
    //translate([0,-83.4/2-10,0])difference(){cylinder(d2=8,d1=14,h=10);cylinder(d=4.3,h=12);}


    //presence sensor
    translate([0,45,2.2])rotate([0,0,90])difference(){
        cube([34,23,4],true);
        cube([21,21,5],true);
        translate([13.5,0,-3])cylinder(d=3,h=6);
        translate([-13.5,0,-3])cylinder(d=3,h=6);
    }
    
    
    //snapfit border
    translate([-40,64,8])rotate([0,90,0])cylinder(d=3,h=80);
    translate([-40,-64,8])rotate([0,90,0])cylinder(d=3,h=80);
    translate([-39,-64,8])rotate([-90,0,0])cylinder(d=3,h=128);
    translate([39,-64,8])rotate([-90,0,0])cylinder(d=3,h=128);
}



module pcbBox(){
//1 gang electrical box has inside dimenasions of 54mmx74mm
//#cube([54,74,40],true);
    
    difference(){
    cube([70,52,40],true);
        
    translate([0,1.2,1.2])cube([68,52,40],true);
    
   //holes for the power wires
   translate([-19.5,-15,-40])
   rotate([0,0,90])for(i=[0,1,2,3,4]){
    translate([i*5.08,0])cylinder(d=3.5,h=50);
   }
}

    //box plate mounting
    difference(){
        union(){
        translate([30,0,10])cube([10,50,20],true);
        translate([-30,0,10])cube([10,50,20],true);
        translate([30,20,-10])cube([10,10,20],true);
        translate([-30,20,-10])cube([10,10,20],true);
        }
    translate([22,30,-1])rotate([90,0,0])scale([1.3,2.3,1])cylinder(d=20,h=60);    
    translate([-22,30,-1])rotate([90,0,0])scale([1.3,2.3,1])cylinder(d=20,h=60);
    for(i=[-3,-5,-7,0,7,5,3]){
        translate([13*2.54,(i)*2.54,13.5])cylinder(d=1.6,h=10);
        translate([-13*2.54,(i)*2.54,13.5])cylinder(d=1.6,h=10);
    }    
    for(i=[-8,-6,-4,-1,1,4,6,8]){
        translate([12*2.54,(i)*2.54,13])cylinder(d=1.6,h=10);
     translate([-12*2.54,(i)*2.54,13])cylinder(d=1.6,h=10);}
    }
    
    //mounts for the board
    translate([20,-25+5,-19.1])rotate([0,0,90]){post();
    translate([15*2.54,0])post();
    translate([0,16*2.54])post();
    translate([15*2.54,39])post();
    }
   
}

module post(){
    difference(){
        cylinder(d1=8,d2=4,h=3);
        cylinder(d=1.8,h=30);
        }

}

module button() {
    cylinder(d=5,h=3);
    translate([0,0,0]) sphere(d=5);
    scale([0.5,0.8,0.1])leg();
    rotate([0,0,180])scale([0.5,0.8,0.1])leg();
    
}



module leg($fn=100){
	scale([1,1.05,1]) translate([5,5,0]) rotate([0,0,30]) difference(){
		translate([0,5,0]) cylinder(r=10, h=6.4);
		translate([0,5,-1]) cylinder(r=8, h=8);
		translate([0,-10,-1])  cube([10,30,8]);
		translate([-20,-10,-1])  cube([30,10,8]);
	}
    translate([0,18,0])difference(){
    cylinder(d=5,h=1);
        cylinder(d=1,h=1);
        }
}


module faceplate(){
  difference(){
    translate([0,-4,3])cube([70,78,4],true);
 AZ3166Board(true);
    //translate([0,-46,0]) endcap(false);
   translate([0,2,0])cube([66,55,7.8],true);
   translate([0,-78/2,2])cube([72,8,4],true);
 
 //holes for endcap join
translate([-31,-78/2+6,-6])cylinder(d=1,h=10);
translate([31,-78/2+6,-6])cylinder(d=1,h=10);
      
       //holes for backplate
translate([-31,-78/2+11,-6])cylinder(d=1,h=10);
translate([31,-78/2+11,-6])cylinder(d=1,h=10);
      translate([-31,78/2-7,-6])cylinder(d=1,h=10);
translate([31,78/2-7,-6])cylinder(d=1,h=10);
  }  
}

module endcapv2(){
    
translate([0,-20,0])endcapPlate();
  
 difference(){

translate([0,5,1])cube([70,10,7],true);

translate([0,43,0.2])cube([52,77,2.2],true);
translate([0,5,2])cube([60.2,12,2.2],true);

 }
 //the bottom side
 difference(){
    translate([0,8,-2])cube([70,16,1.5],true);
    translate([-31,13,-2.8])cylinder(d1=4,d2=0.4,h=1.6);
    translate([31,13,-2.8])cylinder(d1=4,d2=0.4,h=1.6);
    
    translate([-20.5,13,-2.8])cylinder(d2=4,d1=0.4,h=1.6);
    translate([20.5,13,-2.8])cylinder(d2=4,d1=0.4,h=1.6);
}
}

module endcapPlate(showAll=true){

difference(){

translate([0,5,2])cube([60,10,2],true);


if (showAll)    
for(i=[-20,-18,-15,-14,-13,-12, -9,-7,-6,-5,-4,-3,0,2,3,4,5,9,12,13,17])
    {
        off=sign(i)*0;
        
        translate([i*1.25+off,4,0])cylinder(d=1,h=10);
        translate([i*1.25+off,8,0])cylinder(d=1,h=10);
        translate([i*1.25+off,9.75,0])cylinder(d=1,h=10);
        translate([i*1.25+off,12,1])rotate([90,0,0])cylinder(d=1,h=20);
        translate([i*1.25+off,12,3])rotate([90,0,0])cylinder(d=1,h=20);
        }
}
}


module endcap(showAll=true){
difference(){
    translate([0,8,-2])cube([70,16,1.5],true);
    translate([-31,13,-2.8])cylinder(d1=4,d2=0.4,h=1.6);
    translate([31,13,-2.8])cylinder(d1=4,d2=0.4,h=1.6);
    
    translate([-20.5,13,-2.8])cylinder(d2=4,d1=0.4,h=1.6);
    translate([20.5,13,-2.8])cylinder(d2=4,d1=0.4,h=1.6);
}
difference(){

translate([0,5,0])cube([70,10,5],true);

translate([0,40,0])cube([53,77,2.2],true);//AZ3166Board();
//for(i=[-20*1.25:1.25:20*1.25])
if (showAll)    
for(i=[-20,-18,-15,-14,-13,-12, -9,-7,-6,-5,-4,-3,0,2,3,4,5,9,12,13,17])
    {
        off=sign(i)*0;
        
        translate([i*1.25+off,4,0])cylinder(d=1,h=10);
        translate([i*1.25+off,8,0])cylinder(d=1,h=10);
        translate([i*1.25+off,9.75,0])cylinder(d=1,h=10);
        translate([i*1.25+off,12,1.2])rotate([90,0,0])cylinder(d=1,h=20);
        translate([i*1.25+off,12,2.6])rotate([90,0,0])cylinder(d=1,h=20);
        }
}
}



module AZ3166Board(showAll){
cube([52,77,1.6],true);
    color("black")if (showAll){
        //rgbLED
        translate([-26+5.5,-77/2+20,1.8])cylinder(d=5,h=3);
        
        //btn A
        translate([-26+5,-77/2+30,3])cube([7,7,6],true);
        
        //oled
        translate([0,-77/2+29,3])cube([26,15,6],true);
        
        //btn B
        translate([26-5,-77/2+30,3])cube([7,7,6],true);
        
        //leds
        translate([26-5.5,-77/2+20,1.8]) cube([2,8,6],true);
        
        //reset 
      translate([26-2,-77/2+60,0])cylinder(d=2,h=6);
        
        //microphone
        translate([2,18]) cylinder(d=3,h=6);
        
        //sensors
        for(i=[0:2:6])
            translate([i*2+10,-30])cube([1.5,4,10]);
        
        //audio jack
        translate([-1,23])cube([8,20,10]);
        
        //other boards and spaces
        color("blue")translate([0,0,1.5])cube([52,77,5],true);
        }

}