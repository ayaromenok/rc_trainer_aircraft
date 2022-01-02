include <../../lib/lib2.scad>


frontWheel();
//frontWheelPart();

module frontWheel(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yTube(5,1.7,18,     0,0,2);
        yTube(50,48.7,10,   0,0,-2 );
        yTube(50,45,1.2,    0,0,-6.4 );
        for(i = [0:60:360]){
            rotate([0,0,i])
            frontWheelPart(0,26.7,-2, length=27, height=10);
        }
    }//transform
}//module  

module frontWheelPart(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=25, height=5){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        translate([length/4,-length/2.4,0])
        difference(){
            yTube(length/2, length/2-0.8, height);
            yCube(length,length,height+1, length/4,0,0);
        }
        translate([-length/4,length/2.4,0])
        difference(){
            yTube(length/2, length/2-0.8, height);
            yCube(length,length,height+1, -length/4,0,0);
        }
    }//transform
}//module  
        