include <../../lib/lib2.scad>
include <../../lib/lib2/ext/motor.scad>

//suitable for 8" props
engineMount();
//frontWheelPart();

module engineMount(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){    
        difference(){
            union(){
                yCyl(szz=3, rb=20.8, rt=19.4);
                blMotor2212_botX(24,0,17.5, 0,0,45);
                yTube(2,0.9,4,  35.5,11.6,0.5);
                yTube(2,0.9,4,  35.5,-11.6,0.5);
            }//union            
            yCyl(0.9,5,  12.5,11.6,0);
            yCyl(0.9,5,  12.5,-11.6,0);
            yCyl(13.5,10);
        }//union
        
    }//transform
}//module  