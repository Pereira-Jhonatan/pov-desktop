#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes2.inc" 
#include "Woods.inc"
#include "Stones.inc"
#include "Metals.inc"

light_source {<0, 100, 0> color rgb <1, 1, 1>}
                 
light_source {<5, 100, -95> color rgb <1, 1, 1>}
light_source {<72.5, 100, -250> color rgb <1, 1, 1>}

                
light_source {<0, 300, -20> color rgb <1, 1, 1>}                 
/*camera {
    location <-60, 90, -80>
    look_at <20, 25, -20>}*/

camera {
    location <65, 65, -300>
    look_at <65, 60, 0>} 
   
sphere {<0, 0, 0> 200000 pigment {image_map
    {jpeg "Sao_Paulo.jpg" 
    map_type 1}
    scale <.0001, .0001, .0001>
    rotate y*-90
    translate <0, 00, 0>}}

//paredes
difference{
    box {<-63, -5, 5>, <103, 120, -153> pigment {color rgb <0.05, .064, .085>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}
    box {<-60, -4, 1>, <100, 117, -150> pigment {color rgb <0.05, .064, .085>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}
    box {<15, 25, 30>, <75, 80, -10> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}
    box {<55, -2, -149>, <90, 80, -154> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}     
        } //paredes com o sburacos pra porta e janela 
        
difference { //pra mudar a cor de uma das paredes
    box {<-60, -1, 1>, <100, 117, .5> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}
    box {<15, 25, 30>, <75, 80, -10> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .1 reflection{0.001}}}}            

difference{  
    box {<42, -5, -353>, <103, 120, -153> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .2 reflection{0.001}}}
    box {<45, -4, 1>, <100, 117, -350> pigment {color rgb <.25,  .25, .25>}
        normal { bozo 3.5 scale 0.050 }
        finish { phong .2 reflection{0.001}}}
        } //paredes do corredor

//Teto
box {<-63, 117, 4>, <103, 116.9, -153> pigment {color rgb <.25,  .25, .25>}}
//chão
box {<-63, -1, 4>, <103, -0.2, -353> texture{ pigment {color rgb <.02, .01, 0>}   
    normal { wood 0.9 scale 0.35 turbulence 0.1 rotate<0,0,0> } 
    rotate<0,0,0> scale 3.5 translate<0,0,0>}}

//box {<-63, 0, 4>, <103, .00012, -353> pigment {color rgbf <.25 .25, .25, .98>}}//deixa o chão com um tom de madeira mais escuro (basicamente um verniz) 

#declare tile =  
    box {<95.3, -1, 19.7>, <99.70, .0001, -19.70> texture {pigment {color rgb <.2, .08, .01>}   
        normal {wood 1.9 scale 0.55 turbulence 0.1 rotate<0,0,0>} 
        rotate<0,0,0> scale .55 translate<0,0,0>}} //declara um laminado do chão
        
#declare tileX = 0;
#declare tileCountX = 0;
#while (tileCountX < 22)
    #declare tileCount = 0;
    #declare tileZ = 4;
    #while (tileCount < 13)
        object {tile translate <tileX, 0, tileZ>}
        #declare tileZ = tileZ - 39.7;
        #declare tileCount = tileCount + 1;
        #end
    #declare tileX = tileX - 9.3;
    #declare tileCountX = tileCountX + 1;
    #end 

#declare tileX = -4.65;
#declare tileCountX = 0;
#while (tileCountX < 22)
    #declare tileCount = 0;
    #declare tileZ = -18;
    #while (tileCount < 13)
        object {tile translate <tileX, 0, tileZ>}
        #declare tileZ = tileZ - 39.7;
        #declare tileCount = tileCount + 1;
        #end
    #declare tileX = tileX - 9.3;
    #declare tileCountX = tileCountX + 1;
    #end  //dois whiles para intercalar as colunas de laminados e não ficar um do lado do outro

//Moldura da janela
difference {
    box {<14.5, 24.5, 4.5>, <75.5, 80.5, 0> pigment {color rgb <.45,  .45, .45>}}
    box {<15.1, 25.1, 45.5>, <74.9, 79.9, -1> pigment {color rgb <.45,  .45, .45>}}}


//folha da janela
#declare folhaJanela = union{            
    difference {
        box{<-7.5, -27.5, -.5>, <7.5, 27.5, .5> pigment {color rgb <.05,  .05, .05>} texture { T_Chrome_3A finish { phong 1}}}
        box{<-6.5, -26.5, -.51>, <6.5, 26.5, .51> pigment {color rgb <.05,  .05, .05>} texture { T_Chrome_3A finish { phong 1}}}
    } //moldura da folha
                                        
    #declare friso = box{<-6.5, .5, -.1>, <6.5, -.5, .1> pigment {color rgb <.15,  .15, .15>} 
        texture { T_Chrome_3A finish { phong 1}} rotate x*-30} //declara o friso            
                                        
    #declare frisoCount = 0;
    #declare frisoY = 26;
    #while (frisoCount < 54)
        object {friso translate <0, frisoY, 0>}
            #declare frisoCount = frisoCount + 1;
            #declare frisoY = frisoY - 1;
            #end //preenche a moldura de frisos
}
//chama e posiciona 4 folhas da janela            
object {folhaJanela translate <22.5, 52, 2>}
object {folhaJanela translate <67.5, 52, 2>}
object {folhaJanela translate <26.5, 52, 3>}
object {folhaJanela translate <63.5, 52, 3>}

//Batente da Porta
difference {
    box{<54.5, 0, -149.5>, <90.5, 80.5, -153.5>}
    box{<56, -2, -149>, <89, 79, -154>}
    box{<55.5, 0, -149>, <89.5, 79.5, -151>}
        texture{ pigment {color rgb <.5, .4, .3>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>}
    }
box{<89.6, 76, -149.01>, <89.49, 73, -150.5> texture{T_Silver_3A}}
box{<89.6, 37, -149.01>, <89.49, 34, -150.5> texture{T_Silver_3A}}
box{<89.6, 6, -149.01>, <89.49, 3, -150.5> texture{T_Silver_3A}}

//porta     
union{
    difference{ 
        box {<0, .2, 0>, <-34, 79.5, -2> texture{ pigment {color rgb <.7, .6, .5>}    
                    normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
                    rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
        box {<-29, 76, -3>, <-18, 42, 3> texture{ pigment {color rgb <.6, .5, .4>}    
                    normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
                    rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
        box {<-16, 76, -3>, <-5, 42, 3> texture{ pigment {color rgb <.6, .5, .4>}    
                    normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
                    rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
        box {<-29, 35, -3>, <-18, 4, 3> texture{ pigment {color rgb <.6, .5, .4>}    
                    normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
                    rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
        box {<-16, 35, -3>, <-5, 4, 3> texture{ pigment {color rgb <.6, .5, .4>}    
                    normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
                    rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
        cylinder {<-31.5, 37.6, .03>, <-31.5, 37.6, -2.03> .18}
        cone {<-31.5, 37.6, 0> .08, <-31.5, 36.8, 0> .18 scale <1, 1, 40>}
        }
    box {<0, .2, -1.4>, <-34, 79.5, -.6> texture{ pigment {color rgb <.6, .5, .4>}    
              normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
              rotate<0,0,0> scale .5 translate<0,0,0>}
                    }
    box{<-.01, 76, -1.5>, <.01, 73, -.01> texture{T_Silver_3A}}
    box{<-.01, 37, -1.5>, <.01, 34, -.01> texture{T_Silver_3A}}
    box{<-.01, 6, -1.5>, <.01, 3, -.01> texture{T_Silver_3A}}
    
    difference{
        union{        
            box {<-32.5, 36 ,.02>, <-30.5, 41 , -2.02> texture{T_Silver_3A}}
            cylinder {<-31.5, 36, .02>, <-31.5, 36, -2.02> 1 texture{T_Silver_3A}}
            cylinder {<-31.5, 41, .02>, <-31.5, 41, -2.02> 1 texture{T_Silver_3A}}
        
        }
        cylinder {<-31.5, 37.6, .03>, <-31.5, 37.6, -2.03> .18}
        cone {<-31.5, 37.6, 0> .08, <-31.5, 36.8, 0> .18 scale <1, 1, 40>}
    }
    cylinder {<-31.5, 40, 3>, <-31.5, 40, -3> .2 texture{T_Silver_3A}}
    union{
        box {< 0, .32, -2.8>, <3, -.32, -3.1> texture{T_Silver_3A}}
        box {< 0, .32, 0.8>, <3, -.32, 1.1> texture{T_Silver_3A}} 
        rotate z*-20 //rotate para virar a maçaneta 
        translate<-32, 40, 0>}
    rotate y*92 //rotate par abrir a porta
    translate <89.5, 0, -149.5>
    }
 
//Comoda
#declare comoda = union {    
    difference {
        box {<100, .5, -1>, <80, 35, -40> texture{ pigment {color rgb <.1, .02, 0>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>}} 
        box {<99, 0, -2>, <70, 36, -39> texture{ pigment {color rgb <.1, .02, 0>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>}}
    }
    
    box {<100, 34, -.8>, <79.5, 35.01, -40.2> texture{ pigment {color rgb <.2, .05, 0>}    
        normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
        rotate<0,0,0> scale .5 translate<0,0,0>}}
    
    box {<81, 0.5, -2>, <80, 3, -39> texture{ pigment {color rgb <.2, .05, 0>}    
        normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
        rotate<0,0,0> scale .5 translate<0,0,0>}}
    #declare gaveta = union{              
        box {<79.5, 26.1, -1>, <80, 33.8, -40> texture{ pigment {color rgb <.1, .02, 0>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>
                                          }}
        sphere {<78.7, 29.95, -10> 1 texture{ pigment {color rgb <.25, .05, 0>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>}}
        sphere {<78.7, 29.95, -30> 1 texture{ pigment {color rgb <.25, .05, 0>}    
            normal { wood .5 scale .55 turbulence 0.1 rotate<0,0,0> } 
            rotate<0,0,0> scale .5 translate<0,0,0>}}
    }
    object {gaveta}
    object {gaveta translate <0, -8, 0>}
    object {gaveta translate <0, -16,0>}
    object {gaveta translate <0, -24, 0>}
}
object {comoda translate <0, 0, -70>}

//Guarda Roupa
#declare guardaRoupa = union{
    difference{
        box {<100, .5, -42>, <76, 89, -108> texture{ pigment {color rgb <.3, .29, .2>}    
            normal { wood .8 scale .15 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale .15 translate<0,0,90>}}
        box {<77, 0, -43>, <76, 89, -107> texture{ pigment {color rgb <.25, .24, .15>}    
        normal { wood .8 scale .15 turbulence 0.1 rotate<0,0,90> } 
        rotate<0,0,0> scale .15 translate<0,0,90>}}
               }
    box {<99, 90, -42>, <75, 89, -108> texture{ pigment {color rgb <.3, .29, .2>}    
        normal { wood .8 scale .15 turbulence 0.1 rotate<0,0,90> } 
        rotate<0,0,0> scale .15 translate<0,0,90>}} 
    
    #declare portas = union {                                        
        box {<76, 20, -43>, <75, 88.5, -53.3> texture{ pigment {color rgb <.3, .29, .2>}    
            normal { wood .8 scale .15 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale .95 translate<0,0,90>}}
        box {<76, 20, -63.9>, <75, 88.5, -53.6> texture{ pigment {color rgb <.3, .29, .2>}    
            normal { wood .8 scale .15 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale .15 translate<0,0,90>}}
                            
        cylinder {<75, 50, -54.5>, <74.5, 50, -54.5> .5 texture { T_Chrome_3A}}
        cylinder {<75, 60, -54.5>, <74.5, 60, -54.5> .5 texture { T_Chrome_3A}}
        box {<74.5, 62, -54>, <74, 48, -55> texture { T_Chrome_3A}}
                            
        cylinder {<75, 50, -52.5>, <74.5, 50, -52.5> .5 texture { T_Chrome_3A}}
        cylinder {<75, 60, -52.5>, <74.5, 60, -52.5> .5 texture { T_Chrome_3A}}
        box {<74.5, 62, -52>, <74, 48, -53> texture { T_Chrome_3A}}
        }
    
    object {portas}
    object {portas translate <0, 0, -21.33>}
    object {portas translate <0, 0, -42.66>}
    
    #declare gavetasGR = union {
        box {<76, 11, -43>, <75, 19.5, -63.9> texture{ pigment {color rgb <.3, .29, .2>}    
            normal { wood .8 scale .55 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale .95 translate<0,0,90>}}
        box {<76, 10.5, -43>, <75, 2, -63.9> texture{ pigment {color rgb <.3, .29, .2>}    
            normal { wood .8 scale .55 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale .95 translate<0,0,90>}}
        cylinder {<75, 18, -50>, <74.5, 18, -50> .5 texture { T_Chrome_3A}}
        cylinder {<75, 18, -56.9>, <74.5, 18, -56.9> .5 texture { T_Chrome_3A}}
        box {<74.5, 17.5, -48>, <74, 18.5, -58.9> texture { T_Chrome_3A}}
        
        cylinder {<75, 9, -50>, <74.5, 9, -50> .5 texture { T_Chrome_3A}}
        cylinder {<75, 9, -56.9>, <74.5, 9, -56.9> .5 texture { T_Chrome_3A}}
        box {<74.5, 8.5, -48>, <74, 9.5, -58.9> texture { T_Chrome_3A}}
        }
        
    object {gavetasGR}
    object {gavetasGR translate <0, 0, -21.33>}
    object {gavetasGR translate <0, 0, -42.66>}
    }
object {guardaRoupa translate <0, 0, 39>}

#declare quadroCor = 
    union{
        difference {
            box {<-12, -10, 0>, <12, 10, -0.5>}
            box {<-10, -8, -3>, <10, 8, -0.004>}
            texture{ pigment {color rgb <.1, .1, .1>}    
            normal { wood 1.8 scale 1.55 turbulence 0.1 rotate<0,0,90> } 
            rotate<0,0,0> scale 1.95 translate<0,0,90>}}    
        box {<-10, -8, 0>, <10, 8, -0.005> pigment {image_map
            {jpeg "escoladeatenas.jpeg" 
            map_type 0}
            scale <20, 18, 15>
            translate <10, 8, 0>}}
            }

object {quadroCor
        scale <2.5, 2.5, 0> 
        rotate y*-90
        translate <45, 60, -250>}

#declare cabeceira =
    intersection {
        cylinder {<0, 0, .2>, <0, 0, -.2> 29 scale <1, .4, 1>}
        box {<-27, -2.5, .5>, <27, 18, -.5>}
         texture{ pigment {color rgb <.08, .02, .01>}    
         normal { wood .8 scale .55 turbulence 0.1 rotate<0,0,90> } 
         rotate<0,70,0> scale .95 translate<0,0,90>}}

#declare cama = union{
    object {cabeceira
                rotate y*90
                translate <-58, 27, -118>}
    object {cabeceira
                scale <1.15, 1, 1>
                rotate y*90
                translate <38, 15.5, -118>}            
                
    box {<-59, 0, -149>, <-57, 40, -145> 
             texture{ pigment {color rgb <.08, .02, .01>}    
             normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
             rotate<0,70,0> scale .95 translate<0,0,90>}}
    
    box {<-59, 0, -91>, <-57, 40, -87> 
             texture{ pigment {color rgb <.08, .02, .01>}    
             normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
             rotate<0,70,0> scale .95 translate<10,0,90>}}
             
    box {<39, 0, -149>, <37, 20, -145> 
             texture{ pigment {color rgb <.08, .02, .01>}    
             normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
             rotate<0,70,0> scale .95 translate<0,0,90>}}
    
    box {<39, 0, -91>, <37, 20, -87> 
             texture{ pigment {color rgb <.08, .02, .01>}    
             normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
             rotate<0,70,0> scale .95 translate<10,0,90>}}
    
    difference{
        box {<38, 13, -148.5>, <-59, 20, -87.5> 
                 texture{ pigment {color rgb <.08, .02, .01>}    
                 normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
                 rotate<0,70,0> scale .95 translate<10,0,90>}}
        box {<49, 14, -146.5>, <-69, 30, -89.5> 
                 texture{ pigment {color rgb <.08, .02, .01>}    
                 normal { wood 1.8 scale .55 turbulence 0.1 rotate<0,0,90> } 
                 rotate<0,70,0> scale .95 translate<10,0,90>}}}
    
    object{Round_Box(<-56.8, 14, -146>, <36.8, 22, -90>, 0.75   , 0) 
                    texture{ pigment {color rgb <.3, .1, .1>}
                    normal { pigment_pattern{
                                average pigment_map{[1, gradient z sine_wave]
                                                    [1, gradient y scallop_wave]
                                                    [3, bumps  ]}
                                             translate 0.02 scale 0.5}
                                             2 
                             rotate< 0,0,0> scale 0.15 } // end normal
                    finish { phong 0.3}
                  }}
    object{Round_Box(<-20, 14, -146.001>, <36.801, 22.001, -89.999>, 0.75   , 0) 
                    texture{ pigment {color rgb <.1, .06, .06>}
                    normal { pigment_pattern{
                                average pigment_map{[1, gradient z sine_wave]
                                                    [1, gradient y scallop_wave]
                                                    [3, bumps  ]}
                                             translate 0.02 scale 0.5}
                                             2 
                             rotate< 0,0,0> scale 0.15 } // end normal
                    finish { phong 0.3}
                  }}
    object{Round_Box(<-20, 14, -147>, <-10, 23.001, -89>, 0.75   , 0) 
                    texture{ pigment {color rgb <.2, .16, .16>}
                    normal { pigment_pattern{
                                average pigment_map{[1, gradient z sine_wave]
                                                    [1, gradient y scallop_wave]
                                                    [3, bumps  ]}
                                             translate 0.02 scale 0.5}
                                             2 
                             rotate< 0,0,0> scale 0.15 } // end normal
                    finish { phong 0.3}
                  }}
                  
    object{Round_Box(<-55.8, 26, -145>, <-35, 22, -119>, 6.75   , 0) 
                    texture{ pigment {color rgb <.1, .06, .06>}
                    normal { pigment_pattern{
                                average pigment_map{[1, gradient z sine_wave]
                                                    [1, gradient y scallop_wave]
                                                    [3, bumps  ]}
                                             translate 0.02 scale 0.5}
                                             2 
                             rotate< 0,0,0> scale 0.15 } // end normal
                    finish { phong 0.3}
                  }}
    
     
    object{Round_Box(<-55.8, 26, -91>, <-35, 22, -117>, 6.75   , 0) 
                    texture{ pigment {color rgb <.1, .06, .06>}
                    normal { pigment_pattern{
                                average pigment_map{[1, gradient z sine_wave]
                                                    [1, gradient y scallop_wave]
                                                    [3, bumps  ]}
                                             translate 0.02 scale 0.5}
                                             2 
                             rotate< 0,0,0> scale 0.15 } // end normal
                    finish { phong 0.3}
                  }}
 }
 object {cama}

 #declare TV =
     union{
          union{
            difference{ 
              object{Round_Box(<-10, -7, -5>, <10, 7, -20>, .75   , 0) }
              box{<-10, -15, -25>, <10, 15, 25> rotate y*25 translate <-10.5, 0, 10>}
              box{<-10, -15, -25>, <10, 15, 25> rotate y*-25 translate <10.5, 0, 10>}
              box{<-10, -15, -25>, <10, 15, 25> rotate x*10 translate <0, 18, 10>}
              box{<-8, -5.2, -18>, <8, 5.7, -40>}
                  pigment {color rgb <.05, .05, .05>}
                  normal { bozo 6.5 scale 0.05 }
          }
          
          intersection{
              sphere{<0, 0.2, 60> 80 finish {Metal} scale<1.5, 1, 1>}
              box{<-8, -5.7, -17>, <8, 5.7, -20>}}
          
          text { ttf "tahoma.ttf" "SHARP" 1, 0
            pigment { color rgb <1, 1, 1> }
            finish {Metal}
            scale <.5,.5,.8>
            translate <-.8, -6, -20.01>}
            
           
          
          cylinder {<7, -5.8, -17>, <7, -5.8, -20.02> .4 pigment {color rgb <.1, .1, .1>}}
          cylinder {<6, -5.8, -17>, <6, -5.8, -20.02> .2 pigment {color rgb <.1, .1, .1>}}
          cylinder {<5, -5.8, -17>, <5, -5.8, -20.02> .2 pigment {color rgb <.1, .1, .1>}}
          cylinder {<4, -5.8, -17>, <4, -5.8, -20.02> .2 pigment {color rgb <.1, .1, .1>}}
          cylinder {<3, -5.8, -17>, <3, -5.8, -20.02> .2 pigment {color rgb <.1, .1, .1>}}                                               
          scale <1, 1.4, 1>
          }
          union{    
              cone {< 0, 0, 0> 1.5, <0, 1, 0> .5  pigment {color rgb <.02,  .02, .02>}
                normal { bozo 3.5 scale 0.050 }
                finish { phong .2 reflection{0.001}}}
              cylinder {<0, .5, 0>, <-2, 10, 0> .05 pigment {color rgb <.5, .5, .5>} finish {Metal}}
              cylinder {<0, .5, 0>, <2, 10, 0> .05 pigment {color rgb <.5, .5, .5>} finish {Metal}}
              rotate y*-5
              translate <-4, 9.5, -17>}
          }
          
          object {TV rotate y*80 translate <100, 44.8, -80>} 