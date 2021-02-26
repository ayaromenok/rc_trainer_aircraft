include <longeron.scad>
include <nervure.scad>

//ToDo: add alu longeron horizontal
//wing_165mm(isSectionCentral= true);
//wing_165mm(0,165,0);
//wing_82mm(isSectionCentral= true);
//wing_165mm(0,-165,0, my=1);
wing_aeliron();

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

module wing_aeliron(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=150, isAdhesion=true, isSectionCentral=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //central longerons
        longeron_new(12,-20,0, isSameSideCut=isSectionCentral, length=length, size=4, height=13.6, isAdhesion=false);
        longeron_new(-34,-20,0,isSameSideCut=isSectionCentral, length=length, height=12.3, isAdhesion=false);
        //aeliron longeron
        longeron_new(-48,0,0,isSameSideCut=isSectionCentral, length=110, height=10.5, isAdhesion=false);
        yCube(4,110,0.8,    -105,0,0.4);                     //back longeron
        difference(){                                           //front longeron
            yCube(4,length,0.8,    44.5,-20,1, 0,-35,0);
            yCube(4,length+2,2,       44.5,-20,-1);
        }//difference
        
        //nervures
        nervure_clark_y_aeliron_support(0,19,0, width=2);        
        nervure_clark_y_aeliron_support(0,54,0, width=2);
        nervure_clark_y_aeliron_support(0,-19,0, width=2);
        nervure_clark_y_aeliron_support(0,-54,0, width=2);
        
        
        nervure_clark_y_aeliron(0,19,0, width=2);
        nervure_clark_y_aeliron(0,54,0, width=2);
        nervure_clark_y_aeliron(0,-19,0, width=2);
        nervure_clark_y_aeliron(0,-54,0, width=2);
        
        //horizontal alu
        yCube(10,10,2,  -12,19,0);
        yCube(10,10,2,  -12,50,0);
        yCube(10,10,2,  -12,-19,0);
        yCube(10,10,2,  -12,-54,0);
        //additiona aeliron support
        yTube(5.5,1.1,2,    -44+px,py+57,5.5+pz,    90+rx,0+ry,0+rz);
        yCube(6,2,7,    -37+px,py+57,5.5+pz,      rx,0+ry,0+rz);
        yCube(2,4,11,    -35+px,py+56,5.5+pz,      rx,0+ry,0+rz);
        yTube(5.5,1.1,2,    -44+px,py-57,5.5+pz,    90+rx,0+ry,0+rz);
        yCube(6,2,7,    -37+px,py-57,5.5+pz,      rx,0+ry,0+rz);
        yCube(2,4,11,    -35+px,py-56,5.5+pz,      rx,0+ry,0+rz);
        //adheison
        if(isAdhesion){            
            yCube(8,8,0.45, 44.5,-length/2+4-20,0.225);
            yCube(8,8,0.45, 13,-length/2+4-20,0.225);
            yCube(8,8,0.45, -33,-length/2+4-20,0.225);
        }//if(isAdhesion){
    }//translate
}//module
