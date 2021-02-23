include <longeron.scad>
include <nervure.scad>


//wing_165mm(isSectionCentral= true);
//wing_165mm(0,165,0);
wing_82mm(isSectionCentral= true);
//wing_165mm(0,-165,0, my=1);

module wing_165mm(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=200, isAdhesion=true, isSectionCentral=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //central longerons
        longeron_new(0,0,0, isSameSideCut=isSectionCentral, length=length);
        longeron_new(-30,0,0,isSameSideCut=isSectionCentral, length=length);
        
        yCube(4,length,0.8,    -105,0,0.4);                     //back longeron
        difference(){                                           //fron longeron
            yCube(4,length,0.8,    44.5,0,1, 0,-35,0);
            yCube(4,length+2,2,       44.5,0,-1);
        }//difference
        
        //nervures
        nervure_clark_y(0,22,0, width=3);
        nervure_clark_y(0,-22,0, width=2);
        nervure_clark_y(0,64,0, width=2);
        nervure_clark_y(0,-64,0, width=3);
        
        if(isAdhesion){
            yCube(8,8,0.45, -105,length/2-4,0.225);
            yCube(8,8,0.45, -105,-length/2+4,0.225);
            yCube(8,8,0.45, 44.5,length/2-4,0.225);
            yCube(8,8,0.45, 44.5,-length/2+4,0.225);
        }//if(isAdhesion){
    }//translate
}//module
module wing_82mm(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=120, isAdhesion=true, isSectionCentral=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //central longerons
        longeron_new(0,0,0, isSameSideCut=isSectionCentral, length=length, size=4, height=13.6);
        longeron_new(-30,0,0,isSameSideCut=isSectionCentral, length=length, height=12.3);
        
        yCube(4,length,0.8,    -105,0,0.4);                     //back longeron
        difference(){                                           //fron longeron
            yCube(4,length,0.8,    44.5,0,1, 0,-35,0);
            yCube(4,length+2,2,       44.5,0,-1);
        }//difference
        
        //nervures
        nervure_clark_y(0,22,0, width=3);
        nervure_clark_y(0,-22,0, width=2);        
        
        if(isAdhesion){
            yCube(8,8,0.45, -105,length/2-4,0.225);
            yCube(8,8,0.45, -105,-length/2+4,0.225);
            yCube(8,8,0.45, 44.5,length/2-4,0.225);
            yCube(8,8,0.45, 44.5,-length/2+4,0.225);
        }//if(isAdhesion){
    }//translate
}//module