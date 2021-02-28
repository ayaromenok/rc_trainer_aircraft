include <../lib/lib2.scad>


//nervure_clark_y(0,-10,0);
//nervure_clark_y_aeliron_support(0,0,0);
//nervure_clark_y_aeliron(0,10,0);

module nervure_clark_y_aeliron(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, sx=1,sy=1,sz=1, width=3){
    difference(){
        nervure_clark_y(px,py,pz,rx,ry,rz,mx,my,mz,sx,sy,sz,width);
        yCube(120,width*3,20, 16+px,0+py,9.5+pz, rx,ry,rz);
    }//transform
    yTube(5.5,1.5,width,    -44+px,py,5.5+pz,    90+rx,0+ry,0+rz);
    
}//module 

module nervure_clark_y_aeliron_support(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, sx=1,sy=1,sz=1, width=3){
    difference(){
        nervure_clark_y(px,py,pz,rx,ry,rz,mx,my,mz,sx,sy,sz,width);
        yCube(70,width*3,20, -74.5+px,0+py,9.5+pz, rx,ry,rz);
        yCube(10,width*3,10, -40.5+px,0+py,pz, rx,ry,rz);
    }//transform
    
}//module 

module nervure_clark_y(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, sx=1,sy=1,sz=1, width=3){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])
    scale([sx,sy,sz]){
        color("lightgreen")
        difference(){
            union(){
                yCyl(5,width,  41.5,0,2.5,  90,0,0, sy=0.5);                
                difference(){
                    yCyl(13.5,width,  0,0,0,  90,0,0, sx=3.53);
                    yCube(60,10,30, -30.1,0,0);                    
                    yCube(20,10,10, 51.8,0,-1.9);
                }//difference
                difference(){
                    yCyl(20,width,  -60,0,-11.15,  90,-8.5,0, sx=5);
                    yCube(60,10,30, 30,0,0);                    
                }//difference
                
            }//union
            yCube(300,10,40, -30,0,-20);    //bottom cut 
            nervure_cut(38,0,1, 10, width*2);
            nervure_cut(22,0,1, 17, width*2);
            nervure_cut(5,0,1, 21, width*2, sx=0.6);
            nervure_cut(-10.2,0,1, 21, width*2, sx=0.6);
            nervure_cut(-26.2,0,1, 20, width*2, sx=0.7);
            nervure_cut(-43.5,0,1, 16, width*2);
            nervure_cut(-60,0,1, 13, width*2);
            nervure_cut(-73,0,1, 9, width*2);
            nervure_cut(-83,0,1, 6, width*2);            
        }//difference
        //make bottom part more strong
        yCube(135,0.85,0.8, -24,0,1.5);
    }//transform
}//module    

module nervure_cut(px=0,py=0,pz=0, s=10, width=10, sx=1,sy=1,sz=1){
    translate([(px), (py), pz])
    scale([sx,sy,sz]){
        s_2=s/2;
        s_4=s/4;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        yPoly(_p, szz=width, py=width/2,rx=90);
    }//translate
}//module

//original DXF nervure - Clark Y
/*
translate([45,0,0])
rotate([90,0,180])
linear_extrude(height = 1, center = true, convexity = 10)
                        import(file = "../stl/test/profile_clark_y.dxf", layer="clark_y_main"); 
//*/