include <../lib/lib2.scad>


nervure_clark_y(width=2);

module nervure_clark_y(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, length=150, width=3, isAdhesion=true, isSameSideCut=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])    {
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
                    yCyl(20,width,  -60,0,-11,  90,-8.5,0, sx=5);
                    yCube(60,10,30, 30,0,0);
                    
                }//difference
            }//union
            yCube(length*2,10,40, -30,0,-20);    //bottom cut
            nervure_cut(38,0,1, 10, width*2);
            nervure_cut(22,0,1, 18, width*2);
            nervure_cut(0,0,1, 22, width*2);
            nervure_cut(-23,0,1, 21, width*2);
            nervure_cut(-43.5,0,1, 17, width*2);
            nervure_cut(-60,0,1, 13, width*2);
            nervure_cut(-73,0,1, 9, width*2);
            nervure_cut(-83,0,1, 6, width*2);
            
        }//difference
    }//transform
}//module    

module nervure_cut(px=0,py=0,pz=0, s=10, width=10){
    translate([(px), (py), pz]){
        s_2=s/2;
        s_4=s/4;
        _p=[[s_2,0],[s_2,s_4],[s_4,s_2],[-s_4,s_2], [-s_2,s_4],[-s_2,0]];
        yPoly(_p, szz=width, py=width/2,rx=90);
    }//translate
}//module
/*
translate([45,0,0])
rotate([90,0,180])
linear_extrude(height = 1, center = true, convexity = 10)
                        import(file = "../stl/test/profile_clark_y.dxf", layer="clark_y_main"); 
//*/