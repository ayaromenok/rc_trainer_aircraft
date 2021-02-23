include <../lib/lib2.scad>

//longeron_old(length=200); //827mm
//longeron_new(length=110, size=4, height=13.2, isSameSideCut=true);
//longeron_new(20,0,0,    length=90, size=3, height=13.2, isSameSideCut=false);

module longeron_new(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=200, height=13.2, size=3, isAdhesion=true, isSameSideCut=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        s_2=size/2;
        s_4=size/4;
        _spt=5;//mm support
        
        _cnt=ceil((length-_spt)/32.6);        
        _step=(length-_spt)/_cnt;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        
        difference(){
            union(){        
                yPoly(_p, szz=(length-_step*2),py=(length-_step*2)/2,rx=90);        
                yPoly(_p, szz=length,py=-length/2,pz=height,rx=-90);        
                
                yPoly(_p, szz=(_step+_spt),px=-1,py=(length/2),rx=90);
                
                yPoly(_p, szz=(_step+_spt),px=-1,py=(length/2-_step-_spt), pz=height,rx=-90);
                if (isSameSideCut){
                    yPoly(_p, szz=(_step+_spt),px=-1,py=(-length/2+_step+_spt),rx=90);
                    yPoly(_p, szz=(_step+_spt),px=-1,py=(-length/2),pz=height, rx=-90);
                } else {        
                    yPoly(_p, szz=(_step+_spt),px=1,py=(-length/2+_step+_spt),rx=90);
                    yPoly(_p, szz=(_step+_spt),px=1,py=(-length/2),pz=height, rx=-90);
                }//if isSameSideCut
                //supports
                for (i=[(-length/2):_step:(length/2)]){
                    yCyl(_spt/2,height,    0,(i+_spt/2),(height/2), sx=(size/_spt*0.8),$fn=6); 
                }//for
                yCyl(_spt/2,height,    -1,(length/2-_spt/2),(height/2), sx=(size/_spt*0.8),$fn=6);
                if (isSameSideCut){
                    yCyl(_spt/2,height,    -1,(-length/2+_spt/2),(height/2), sx=(size/_spt*0.8),$fn=6);
                } else {
                    yCyl(_spt/2,height,    1,(-length/2+_spt/2),(height/2), sx=(size/_spt*0.8),$fn=6);
                }                
            }//union
            //side cuts
            
            yCube(size,(_step*2+_spt),(height*2),    (s_2-0.2),(length/2),(height/2));
            if (isSameSideCut){
                yCube(size,(_step*2+_spt),(height*2),    (s_2-0.2),(-length/2),(height/2));
            } else {
                yCube(size,(_step*2+_spt),(height*2),    (-s_2+0.2),(-length/2),(height/2));
            }//if isSameSideCut
            
        }//difference
            
        if (isAdhesion){
            yCube(10,10,0.4,    0,(length/2-5),0.2);
            yCube(10,10,0.4,    0,(-length/2+5),0.2);
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