include <../../lib/lib2.scad>

tailWheel();

module tailWheel(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yTube(6,1.2,8,     0,0,3);
        yTube(6,1.2,8,     0,0,-3);
        yTube(30,28.7,5,   0,0,-3.5 );
        yTube(30,25,1.2,    0,0,-6.4 );
        for(i = [0:60:360]){
            rotate([0,0,i])
            tailWheelPart(0,16.3,-4.5, length=16, height=5);
        }
    }//transform
}//module  

module tailWheelPart(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=25, height=5){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        translate([length/4,-length/2.45,0])
        difference(){
            yTube(length/2, length/2-0.8, height);
            yCube(length,length,height+1, length/4,0,0);
        }
        translate([-length/4,length/2.5,0])
        difference(){
            yTube(length/2, length/2-0.8, height);
            yCube(length,length,height+1, -length/4,0,0);
        }
    }//transform
}//module  
        