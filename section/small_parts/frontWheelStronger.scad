include <../../lib/lib2.scad>


frontWheelStronger(isLeft=false);

module frontWheelStronger(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isLeft=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(rb=10,rt=5,szz=9, pz=5.5);
                yCyl(rb=5,rt=10,szz=7, pz=-2.5);
            }//union
            yCyl(1.7,20,    0,0,2);
        }//difference
        difference(){
            yCyl(50,8,  0,0,-2);
            yCyl(rb=48,rt=44,szz=4.2, pz=-4.1);
            yCyl(rb=44,rt=48,szz=4.2, pz=0.075 );
        }//difference
        //yTube(50,44,8,   0,0,-2 );        
        for(i = [0:60:360]){
            rotate([0,0,i])
            yCyl(4.63,45,  0,25,-2,  90,(isLeft?60:0),0, $fn=3);
        }
    }//transform
}//module  


        