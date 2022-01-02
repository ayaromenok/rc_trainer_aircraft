include <../../lib/lib2.scad>
include <../../lib/lib2/ext/servo.scad>

servoHolderForRcPlane(isMetal=false, isTop=false);
//servoHolderForRcPlane(isMetal=false, isTop=true);
//tailWheel(-20,14,-10);
module servoHolderForRcPlane(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isTop=false, isMetal=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        if (isTop){
            difference(){
                yMinkCubeCyl(20,24,34,8,    0,4,2, sx=2.5);
                yCyl(4.2,200, 0,1,0,  0,90,0);           
                //yCube(110,20,30,    -15,-5,15);
                yCube(110,20,30,    -15,-5,-15);
                yCube(110,20,31,    -15,14.9,0);
                yCube(60,20,20,   0,-8,17);
                //yCube(60,20,20,   0,-13,14); 
                //to bottom
                yCyl(1.5,20,  20,8,10);
                yCyl(1.5,20,  -20,8,10);                
                yCyl(1.5,20,  10,-5,0);
                yCyl(1.5,20,  -10,-5,0);
                yCyl(3,5,  10,-5,6);
                yCyl(3,5,  -10,-5,6);
                //cut for rudder servo
                yCube(33,12,20,    0,11,10);   
            }//difference        
             
             //servoSg90(0,12,10); //rudder   
        } else {
            difference(){
                yMinkCubeCyl(20,24,30,8,    0,4,0, sx=2.5);
                yCyl(4.4,200, 0,1,0,  0,90,0);
                servoSg90_cut(0,11.5,12); //rudder
                servoSg90_cut(0,-2,-11,    90,0,0);//horizontal
                //cut top
                yCube(110,20,30,    -15,-5,15);                
                //for servo wire
                yCube(5,15,10, -15,15,0);
                yCube(5,15,10, -15,10,-10.1);
                yCyl(4.2,95, 0,15,-5,  0,90,0); 
                yCube(150,10,10, 0,15.8,-10.1);
                //to top
                yCyl(0.8,20,  20,8,10);
                yCyl(0.8,20,  -20,8,10);                
                yCyl(0.8,20,  10,-5,0);
                yCyl(0.8,20,  -10,-5,0);  
            }//difference
            //back chassis removed to back of fuselage. also need to fix it in strait position
            
        }//if isTop        
        
        if(isMetal){
            servoSg90(0,12,10); //rudder
            servoSg90(-30,-3,-11,    90,0,0);//horizontal
            yCyl(4,200, 0,0,0,  0,90,0);
        }//if isMetal
        
    }//transform
}//module

module tailWheel(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        //yCube(30,20,10);
        yCyl(12.5,9,    0,0,-53, 90,0,0);
        yCube(33,4,4,   16.5,0,-53);
        yCube(4,4,53,   33,0,-53/2);
    }//transform
}//module
