include <../lib/lib2.scad>


chassis_wheel();

module chassis_wheel(px=0,py=0,pz=0, rx=0,ry=0,rz=0, radius=60, width=10){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCyl(radius, width, 0,0,width/2);
            yCyl(radius-0.75, width, 0,0,(width/2+0.5));
            yCyl(radius-8, width, 0,0,(width/2-0.5));
        }//difference
        
        difference(){
            union(){
                yCyl(8,14, 0,0,7);        
                yCyl(10,6, 0,0,3);
                for (i=[0:60:(360)]){
                    //yCube(radius*2,1,5,   0,0,2.5, 0,0,i);
                    rotate([0,0,i])
                    chassis_wheel_int(0,34.2,3,    0,0,0);
                }//for
            }//union
            yCyl(5.3,4, 0,0,(7+5.5));
            yCyl(5.3,4, 0,0,(7-5.5));
            yCyl(2,10,  0,0,7);
        }//difference
    }//transform
}//module        

//chassis_wheel_int();
module chassis_wheel_int(px=0,py=0,pz=0, rx=0,ry=0,rz=0, radius=60, width=10){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCyl(20,6,  -15,-12.5,0);
            yCyl(19.25,7,  -15,-12.5,0);
            yCube(40,40,10, -20,-12.5,0);
        }
        difference(){
            yCyl(20,6,  15,12.5,0);
            yCyl(19.25,7,  15,12.5,0);
            yCube(40,40,10, 20,12.5,0);
        }
        
    }//transform
}//module        