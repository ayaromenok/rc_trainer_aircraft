include <../../lib/lib2.scad>


tailWheelHolderBot(-20,0,0);
tailWheelHolderTop(0,-15,-1.5, 0,0,90);

module tailWheelHolderBot(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yMinkCubeCyl(70,16,2,3, 20,0,-2);
                yMinkCubeCyl(30,12,3,3);
            }//union
            yCyl(0.9,10, -10,0,0);
            yCube(30,1.8,1.8,   5,0,0.65);
            yCyl(0.9,10, 16,0,0);
        }//difference
        
    }//transform
}//module            

module tailWheelHolderTop(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeCyl(20,25,3,5);            
            yCyl(0.9,10, 0,0,0);
            yCube(10,30,5,  8,0,0);
        }//difference
        
        
    }//transform
}//module     