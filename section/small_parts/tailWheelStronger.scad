include <../../lib/lib2.scad>


frontWheelStronger(isLeft=false);

module frontWheelStronger(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isLeft=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(rb=7,rt=3,szz=9, pz=5.5);
                yCyl(rb=3,rt=7,szz=5, pz=-1.5);
            }//union
            yCyl(1.2,20,    0,0,2);
        }//difference
        difference(){
            yCyl(30,6,  0,0,-1);
            yCyl(rb=29,rt=26,szz=4.2, pz=-4.1);
            yCyl(rb=26,rt=29,szz=4.2, pz=0.075 );
        }//difference
        //yTube(50,44,8,   0,0,-2 );        
        for(i = [0:120:360]){
            rotate([0,0,i])
            yCyl(3.63,27,  0,15.5,-1,  90,(isLeft?60:0),0, $fn=3);
        }
    }//transform
}//module  


        