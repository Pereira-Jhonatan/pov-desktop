#include "colors.inc"
#include "textures.inc"
#include "shapes.inc" 
#include "Woods.inc"
#include "Stones.inc"
#include "Metals.inc"

//light_source {<0, 40, -1>}
//light_source {<-10, 40, -1>}
//light_source {<10, 40, -1>}
                 
 light_source {<20, 20, -50> color rgb <1, 1, 1> shadowless}
 light_source {<-40, 59, 70> color rgb <1, 1, 1>}
 light_source {<40, 59, -1> color rgb <1, 1, 1>}
                 
camera {
    location <-20, 20, -120>
    look_at <-3, -5, 0>} 
    
background {color SkyBlue}

box {<-3.5, 0, 0>, <3.5, 25, -40> pigment {color rgb <.8, .8, .6>}}

union { 
        union {  
                difference {
                            box {<-7,-32,2>, <7,30,-42>}
                            box {<-6,-33,3>, <6,-30,-43>}
                            box {<-6,0,3>, <6,29,-43>}
                            box {<-6,-29,1>, <-0.5,-12,-43>}
                            box {<0.5,-29,1>, <6,-12,-43>}
                            box {<-6,-11,1>, <6,-1,-43>}
                            box {<-6,-12.01,-41>, <6,-10,-43>}
                            box {<-6,-1.01,-41>, <6,0,-43>}
                            }
                            box {<-5.85,-0.1,-41.1>, <5.85,-11.85,-42.2>}
                            box {<-7,4,2>, <-45,5,-25>}
                            box {<-7,-1,2>, <-45,-2,-42>}
                            box {<-25.5,4,2>, <-26.5,-1,-25>}
                            box {<-46,-2,2>, <-6,-20,1>}
              intersection {             
                            box {<-45,-32,2>, <-46,40,-42>}
                            sphere {<-45,-23,45> 90}
                            }
                            box {<-46,40,2>, <-4,41,-20>}
                difference {
                            box {<-7,-1,2>, <-45,4,1>}
                            sphere {<-8,-2,2> 3
                                    scale<2,0.8,1>}
                            sphere {<-18,-2,2> 3
                                    scale<2,0.8,1>}
                            }                         
                texture { T_Wood1    
                        normal { wood .2 scale 0.2 turbulence 0.1}
                        finish { phong 1 } scale 0.5
                        pigment{ color rgb< 1, 0.80, 0.55>}
                        }
               }
 
        torus {1.5,0.2
                texture{ Spun_Brass
                finish { phong 1 }
                scale 0.5 translate<0,1,0>}   
                pigment {color Gray85}
                scale<-2.2,4,0>
                translate <0,-6,-42.2>}
                  
        cylinder {<0.5,-26,-25>, <6,-26,-25> 0.5 texture{Chrome_Metal}pigment{color Gray85}}
        cylinder {<0.5,-26,-38>, <6,-26,-38> 0.5 texture{Chrome_Metal}pigment{color Gray85}}
        cylinder {<-5.5,30,0>, <-5.5,40,0> 1 texture{Chrome_Metal}pigment{color Gray85}} 
        cylinder {<-5.5,30,-18>, <-5.5,40,-18> 1 texture{Chrome_Metal}pigment{color Gray85}}
        
        union {
                difference {
                            union {            
                                    sphere {<-56.8,-32,-40> 1.5}
                                    sphere {<-8.2,-32,-40> 1.5}
                                    sphere {<8.1,-32,-40> 1.5}
                                    sphere {<-56.8,-32,0> 1.5}
                                    sphere {<-8.2,-32,0> 1.5}
                                    sphere {<8.1,-32,0> 1.5}        
                                            texture{ pigment{ color Gray85} 
                                            normal { bozo 0.5 scale 0.5 }}
                                            scale <0.8,1,1>
                                   }
                            box {<-50,-32.5,5>, <10,-34,-50> pigment {color Gray85}}
                            }
               }
}