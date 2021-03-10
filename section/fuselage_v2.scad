include <../lib/lib2.scad>
include <../share/longeron.scad>

//yCube(100,2,10);
fuselage_side();
module fuselage_side(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_new(0,0,0, 0,0,90, length=length, height=32, isAdhesion=false);
        longeron_new(0,0,0, 0,0,90, length=length, height=12);
        longeron_new(0,0,20, 0,0,90, length=length, height=12, isAdhesion=false);
        
        longeron_new(0,30,0, 0,0,90, length=length, height=9);
        longeron_new(0,-30,0, 0,0,90, length=length, mx=1,height=9);
        
        fuselage_nervure( 0, width=60, height=32, size=4);
        fuselage_nervure( 32.5, width=60, height=32, size=3);
        fuselage_nervure( 65, width=60, height=32, size=4);
        fuselage_nervure( -32.5, width=60, height=32, size=3);
        fuselage_nervure( -65, width=60, height=32, size=4);
        /*
        yCyl(2,10,  15,0,15,  $fn=6, sy=0.8);
        yCyl(2,10,  -15,0,15,  $fn=6, sy=0.8);
        
        yCyl(2,10,  48,1,15,  $fn=6, sy=0.4);
        yCyl(2,10,  -48,-1,15,  $fn=6, sy=0.4);
        */
    }//transform
}//module

module fuselage_nervure(px=0,py=0,pz=0, rx=0,ry=0,rz=0, width=40, height=30, size=3){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        s_2=size/2;
        s_4=size/4;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        yPoly(_p, szz=width,py=width/2,rx=90); 
        yPoly(_p, szz=39,py=0, pz=height,rx=54,ry=180); 
        yPoly(_p, szz=39,py=0, pz=height,rx=-126,ry=0); 
    }//transform
}//module