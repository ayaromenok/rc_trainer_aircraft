include <../lib/lib2.scad>

//solid_wing();
solid_trapezoid_wing();

module solid_trapezoid_wing(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1, length=100, isAdhesion=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        _off=0.59;
        translate([-50,0,-length/2+0.225])
        linear_extrude(height = 0.45, center = true, convexity = 10)
            import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");                
        
        linear_extrude(height = length, center = true, convexity = 10, scale=0.7){
            translate([-50,0,0])
            difference(){
                import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
                
                offset(-_off)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
            }//difference
        }//linear_extrude
        
        yPoly(p=[[0,0],[12.4,0],[8,length],[0,length]], szz=0.45, px=-20,py=0,pz=-length/2, rx=90,rz=90);
        yPoly(p=[[0,0],[12.4,0],[8,length],[0,length]], szz=0.45, px=20,py=0,pz=-length/2, rx=90,rz=90);
        
        solid_wing_nervure(0,0,-24,  sx=0.92,sy=0.92);
        solid_wing_nervure(0,0,0,  sx=0.84,sy=0.84);        
        solid_wing_nervure(0,0,24,  sx=0.77,sy=0.77);
        solid_wing_nervure(0,0,49,  sx=0.7,sy=0.7);
        ///yCyl(2,length,   0,12.3,0, 0,0,30,$fn=3);
        //yCyl(2,length,   0,1,0, 0,0,90,$fn=3);
        
        if(isAdhesion){
            yCube(20,20,0.45,   -54,2,-length/2+0.225);
            yCube(20,20,0.45,   102,0,-length/2+0.225);
        }//if(isAdhesion)
    }//transform
}//module

module solid_wing(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1, length=50, isAdhesion=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        _off=0.45;
        translate([-50,0,-length/2+0.225])
        linear_extrude(height = 0.45, center = true, convexity = 10)
            import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");                
        
        linear_extrude(height = length, center = true, convexity = 10, scale=1){
            translate([-50,0,0])
            difference(){
                import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
                
                offset(-_off)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
            }//difference
        }//linear_extrude
        yCube(0.45,12,length,   -20,6.1,0);
        yCube(0.45,12,length,   20,6.1,0);
        solid_wing_nervure(0,0,24);        
        solid_wing_nervure(0,0,0);        
        ///yCyl(2,length,   0,12.3,0, 0,0,30,$fn=3);
        //yCyl(2,length,   0,1,0, 0,0,90,$fn=3);
        
        if(isAdhesion){
            yCube(20,20,0.45,   -54,2,-length/2+0.225);
            yCube(20,20,0.45,   102,0,-length/2+0.225);
        }//if(isAdhesion)
    }//transform
}//module

//solid_wing_nervure();
module solid_wing_nervure(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        linear_extrude(height = 2.4, center = true, convexity = 10, scale=1){
            translate([-50,0,0])
            difference(){
                import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");                
                offset(-0.8)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
            }//difference
        }//linear_extrude
        
        linear_extrude(height = 1.6, center = true, convexity = 10, scale=1){
            translate([-50,0,0])
            difference(){
                import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");                
                offset(-1.2)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
            }//difference
        }//linear_extrude   
        
        linear_extrude(height = 0.8, center = true, convexity = 10, scale=1){
            translate([-50,0,0])
            difference(){
                import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");                
                offset(-1.6)
                    import(file = "dxf/profile_clark_y.dxf", layer="clark_y_main");
            }//difference
        }//linear_extrude   
    }//transform
}//module            
