include <longeron.scad>
include <nervure.scad>

//ToDo: add alu longeron horizontal
//wing_165mm(isSectionCentral= true);
wing_165mm();
//wing_82mm(isSectionCentral= true);
//wing_165mm(0,-165,0, my=1);
//wing_aeliron();

module wing_165mm(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=200, isAdhesion=true, isSectionCentral=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
                //central longerons
        longeron_new(12,0,0, isSameSideCut=isSectionCentral, length=length, size=4, height=13.6, isAdhesion=false);
        longeron_new(-34,0,0,isSameSideCut=isSectionCentral, length=length, height=12.3, isAdhesion=false);
        //front longeron
        difference(){                                           
            yCube(4,length,0.8,    44.5,0,1, 0,-35,0);
            yCube(4,length+2,2,       44.5,0,-1);
        }//difference
        //back longeron
        yCube(4,length,0.8,    -105,0,0.4);                     
        
                       //back longeron
        
        //nervures
        nervure_clark_y(0,22,0, width=2);        
        nervure_clark_y(0,64,0, width=3);
        nervure_clark_y(0,-22,0, width=2);        
        nervure_clark_y(0,-64,0, width=3);
        
        
        
        
        //horizontal alu
        yCube(5,7,1.6,  -10,20,0.8);
        yCube(10,15,1.6,  -10,64,0.8);
        yCube(5,7,1.6,  -10,-24,0.8);        
        yCube(10,15,1.6,  -10,-64,0.8);
        
        //adhesion
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

module wing_aeliron(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=190, isAdhesion=true, isSectionCentral=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //central longerons
        longeron_new(12,-40,0, isSameSideCut=isSectionCentral, length=length, size=4, height=13.6, isAdhesion=false);
        longeron_new(-34,-40,0,isSameSideCut=isSectionCentral, length=length, height=12.3, isAdhesion=false);
        //front longeron
        difference(){                                           
            yCube(4,length,0.8,    44.5,-40,1, 0,-35,0);
            yCube(4,length+2,2,       44.5,-40,-1);
        }//difference
        //back longeron
        yCube(4,38,0.8,    -105,-116,0.4);                     
        
        //aeliron longeron
        longeron_new(-48,-19,0,isSameSideCut=isSectionCentral, length=148, height=10.5, isAdhesion=false);
        yCube(4,148,0.8,    -105,-19,0.4);                     //back longeron
        
        //nervures
        nervure_clark_y_aeliron_support(0,19,0, width=2);        
        nervure_clark_y_aeliron_support(0,54,0, width=3);
        nervure_clark_y_aeliron_support(0,-19,0, width=2);        
        nervure_clark_y_aeliron_support(0,-58,0, width=2);
        nervure_clark_y(0,-98,0, width=3);
        
        
        nervure_clark_y_aeliron(0,19,0, width=2);
        nervure_clark_y_aeliron(0,54,0, width=2);
        nervure_clark_y_aeliron(0,-19,0, width=2);
        nervure_clark_y_aeliron(0,-54,0, width=2);
        nervure_clark_y_aeliron(0,-54,0, width=2);
        nervure_clark_y_aeliron(0,-92,0, width=2);
        
        //horizontal alu
        yCube(5,7,1.6,  -10,16,0.8);
        yCube(10,10,1.6,  -10,50,0.8);
        yCube(5,7,1.6,  -10,-22,0.8);
        yCube(5,7,1.6,  -10,-61,0.8);
        yCube(10,15,1.6,  -10,-98,0.8);
        
        //additional aeliron support
        yTube(5.5,1.1,2,    -44+px,py+57,5.5+pz,    90+rx,0+ry,0+rz);
        yCube(7,2,11,    -39+px,py+58,5.5+pz,      rx,0+ry,0+rz);
        yCube(2,4,11,    -35+px,py+57,5.5+pz,      rx,0+ry,0+rz);
        
        yTube(5.5,1.1,2,    -44+px,py-95,5.5+pz,    90+rx,0+ry,0+rz);
        yCube(7,2,11,    -39+px,py-96,5.5+pz,      rx,0+ry,0+rz);
        //yCube(2,4,11,    -35+px,py-57,5.5+pz,      rx,0+ry,0+rz);
        //adheison
        if(isAdhesion){            
            yCube(8,8,0.45, 44.5,-length/2+4-40,0.225);
            yCube(8,8,0.45, 13,-length/2+4-40,0.225);
            yCube(8,8,0.45, -33,-length/2+4-40,0.225);
            yCube(8,8,0.45, -105,-length/2+4-40,0.225);
        }//if(isAdhesion){
    }//translate
}//module
