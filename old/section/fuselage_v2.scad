include <../lib/lib2.scad>
include <../share/longeron.scad>


//fuselage_assembly();
module fuselage_assembly(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        fuselage_cone2(340,0,0);
        fuselage_cone2(340,0,0,   180,0,0);
        fuselage_cone3(170,0,0);
        fuselage_cone3(170,0,0,   180,0,0);
        fuselage_cyl(0,0,0);
        fuselage_cyl(0,0,0,   180,0,0);
    }//transform
}//module
//fuselage_cone3(180);
//fuselage_cyl();
module fuselage_cyl(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_new(0,0,0, 0,0,90, length=length, height=32, isAdhesion=false);
        longeron_new(0,0,0, 0,0,90, length=length, height=12);
        longeron_new(0,0,32, 0,0,90, length=length, height=12, isAdhesion=false);
        
        longeron_new(0,50,0, 0,0,90, length=length, height=9);
        longeron_new(0,-50,0, 0,0,90, length=length, mx=1,height=9);
        
        fuselage_nervure2( 65, width=50, height=44, size=4, ry=-90);        
        fuselage_nervure2( 32.5, width=50, height=44, size=3, ry=-90);
        fuselage_nervure2( 0, width=50, height=44, size=4, ry=-90);
        fuselage_nervure2( -32.5, width=50, height=44, size=3, ry=-90);
        fuselage_nervure2( -65, width=50, height=44, size=4, ry=-90);
                //adhesion
        yCube(10,50*2,0.45, -95,0,0.225);
        yCube(10,50*2,0.45, 95,0,0.225);
    }//transform
}//module

module fuselage_cone2(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_new(0,0,0, 0,0,90, length=length, height=32, isAdhesion=false);
        longeron_new(0,0,0, 0,0,90, length=length, height=12);
        longeron_new(0,0,23, 2,0,90, length=length, height=12, isAdhesion=false);
        
        longeron_new(0,26,0, 0,0,84, length=length, height=9);
        longeron_new(0,-26,0, 0,0,96, length=length, mx=1,height=9);
        
        fuselage_nervure2( 65, width=22, height=33, size=4, ry=-90);        
        fuselage_nervure2( 32.5, width=25, height=34.25, size=3, ry=-90);
        fuselage_nervure2( 0, width=28, height=35.5, size=4, ry=-90);
        fuselage_nervure2( -32.5, width=31, height=36.75, size=3, ry=-90);
        fuselage_nervure2( -65, width=34, height=38, size=4, ry=-90);
        
        //adhesion
        yCube(10,34*2,0.45, -95,0,0.225);
        yCube(10,22*2,0.45, 95,0,0.225);
    }//transform
}//module

module fuselage_cone3(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        longeron_new(0,0,0, 0,0,90, length=length, height=37, isAdhesion=false);
        longeron_new(0,0,0, 0,0,90, length=length, height=12);
        longeron_new(0,0,29, 2,0,90, length=length, height=12, isAdhesion=false);
        
        longeron_new(0,43,0, 0,0,84, length=length, height=9);
        longeron_new(0,-43,0, 0,0,96, length=length, mx=1,height=9);
        
        fuselage_nervure2( 65, width=37, height=39, size=4, ry=-90);        
        fuselage_nervure2( 32.5, width=40, height=40.25, size=3, ry=-90);
        fuselage_nervure2( 0, width=43, height=41.5, size=4, ry=-90);
        fuselage_nervure2( -32.5, width=47, height=42.75, size=3, ry=-90);
        fuselage_nervure2( -65, width=50, height=44, size=4, ry=-90);
        
        //adhesion
        yCube(10,50*2,0.45, -95,0,0.225);
        yCube(10,37*2,0.45, 95,0,0.225);
    }//transform
}//module

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

//fuselage_nervure2();
module fuselage_nervure2(px=0,py=0,pz=0, rx=0,ry=0,rz=0, width=40, height=30, size=3){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        s_2=size/2;
        s_4=size/4;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        //yPoly(_p, szz=width,py=width/2,rx=90); 
        //yPoly(_p, szz=39,py=0, pz=height,rx=54,ry=180); 
        //yPoly(_p, szz=39,py=0, pz=height,rx=-126,ry=0); 
        difference(){
            yCyl(width, size, sx=(height/width));     
            difference(){
                yCyl(width-2, size+1, sx=(height/width));   
                yCube(height, width*2, size*2, height*1.3);
            }//diff        
            yCube(height, width*2, size*2, -height/2);
        }//difference
        yCube(2,width*2,size,   1);
        
    }//transform
}//module