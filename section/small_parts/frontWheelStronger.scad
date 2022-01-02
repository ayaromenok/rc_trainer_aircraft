include <../../lib/lib2.scad>


frontWheelStronger(isLeft=false);

module frontWheelStronger(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isLeft=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yTube(5,1.7,16,     0,0,2);
        yTube(50,44,8,   0,0,-2 );        
        for(i = [0:60:360]){
            rotate([0,0,i])
            yCyl(4.63,45,  0,25,-2,  90,(isLeft?60:0),0, $fn=3);
        }
    }//transform
}//module  


        