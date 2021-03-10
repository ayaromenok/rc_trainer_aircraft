include <../lib/lib2.scad>
include <../share/longeron.scad>

//yCube(100,2,10);
fuselage_side();
module fuselage_side(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_new(0,0,0, 0,0,90, length=100, height=20);
        longeron_new(0,20,0, 0,0,90, length=100, height=9);
        longeron_new(0,-20,0, 0,0,90, length=100, mx=1,height=9);
        fuselage_nervure(15, height=20);
        fuselage_nervure(-15, height=20);
    }//transform
}//module

module fuselage_nervure(px=0,py=0,pz=0, rx=0,ry=0,rz=0, width=40, height=30){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        _s=3;
        s_2=_s/2;
        s_4=_s/4;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        yPoly(_p, szz=width,py=width/2,rx=90); 
        yPoly(_p, szz=23,py=0, pz=height,rx=60,ry=180); 
        yPoly(_p, szz=23,py=0, pz=height,rx=-120,ry=0); 
    }//transform
}//module