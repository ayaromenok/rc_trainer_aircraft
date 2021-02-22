include <../lib/lib2.scad>

//longeron_old(length=200); //827mm
longeron_new(length=60, size=3, height=13.2);

module longeron_new(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, height=13.2, size=3, isAdhesion=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        s_2=size/2;
        s_4=size/4;
        _spt=5;//mm support
        
        _cnt=ceil((length-_spt)/32.6);        
        _step=(length-_spt)/_cnt;
        echo(_step);
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);        
        yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=height,rx=-90);
        
        for (i=[(-length/2):_step:(length/2)]){
            yCyl(_spt/2,height,    0,(i+_spt/2),(height/2), sx=(size/_spt*0.8),$fn=4);
            echo(i);
        }//for
        
        if (isAdhesion){
            yCube(10,10,0.4,    0,(length/2-5),0.25);
            yCube(10,10,0.4,    0,(-length/2+5),0.25);
        }// if isAdhesion
        
    }//transform
}//module
module longeron_old(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=200, h=13.2, size=3){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        s_2=size/2;
        s_4=size/4;
        difference(){
            union(){                
                yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=length/2,rx=90);        
                yPoly(p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]], szz=length,py=-length/2,pz=h,rx=-90);
                
                translate([0,-length/2,0])
                for (i=[0:32.6:(length)]){
                    yCyl(2.5,h, 0,i+2.1,h/2, sx=0.4,$fn=6);
                }//for
            }//union
            yCube(size,45,h*2,    (s_2+0.2),length/2,h/2);
            yCube(size,45,h*2,    (-s_2-0.4),-length/2,h/2);
        }//difference        
    }//transform
}//module