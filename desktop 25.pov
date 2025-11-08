#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes2.inc" 
#include "Woods.inc"
#include "Stones.inc"
#include "Metals.inc"

//light_source {<0, 40, -1>}
//light_source {<-10, 40, -1>}
//light_source {<10, 40, -1>}
                 
 light_source {<20, 40, -50> color rgb <1, 1, 1> }
 /*light_source {<-40, 59, 70> color rgb <1, 1, 1>}
 light_source {<40, 59, -1> color rgb <1, 1, 1>}*/
                 
camera {
    location <17, 10, -14>
    look_at <22, 4, 0>} 
    
background {color SkyBlue}    
/*===========================================================================================================================*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////Começo do PC/////////////////////////////////////////////////////////////////
//Simbolo ON/OFF
#declare onoff =  union {difference {torus {5, 0.5}
                                    box {<-1.5, -10, 0>, <1.5, 10, 10>}
                                    }
                         box {<-.5, -.5, 0>, <.5, .5, 5>}
                         }

 #declare dvd = difference {
                             union {cone {<0, 0, 0> 0.1, <0, 10, 0> 3}
                                    difference {sphere {<0, 0, 0> 5}
                                                box{<0, -20, -20>, <-20, 20, 20>} 
                                                translate <-8, 5, 0>}
                                    difference {sphere {<0, 0, 0> 5}
                                                box{<0, -20, -20>, <-20, 20, 20>} 
                                                translate <4, 5, 0>}
                                    pigment {color rgb <1, 1, 1>}
  
                                    }
                            box{<-20, -20, -0.1>, <20, 20, -10>}
                            box{<-20, -20, 0.1>, <20, 20, 10>}
                            pigment {color rgb <.4, .4, .3>}
                            }
                            
 #declare buracos = union {#declare altura = -10;
                        
                        #while (altura < 10 )
                            #declare numeroBolas = -10;
                            #while (numeroBolas < 10)
                                sphere {<numeroBolas, altura, 0> .4 pigment {color rgb <0, 0, 0>}}
                                #declare numeroBolas = numeroBolas + 1;
                            #end
                            #declare altura = altura + 1;
                        #end}        
// union do PC
union { 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////MOnitor//////////////////////////////////////////////////////////////////////////
        union { 
        //Formato do Monitor
        difference{
                    box {<-10, 0, 0>, <10, 20, -20> pigment {color rgb <.8, .8, .6>}
                            finish{
                                  conserve_energy
                                  diffuse 0.6
                                  ambient 0}
                                  normal{bozo 1 scale .005}}
                    cylinder {<-20, 30, 2>, <20, 30, 2> 18 pigment {color rgb <.8, .8, .6>}
                                finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09
                                      }
                                      normal{bozo 1 scale .008}}
                    box {<-5, -2, 10>, <5, 30, -10> pigment {color rgb <.8, .8, .6>}
                                finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}
                            rotate y*10
                            translate <-13.5, 0, -5>}
                    box {<-5, -2, 10>, <5, 30, -10> pigment {color rgb <.8, .8, .6>}
                                finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}
                                  
                            rotate y*-10
                            translate <13.5, 0, -5>}
                    //tela        
                    box {<-8, 2, -16>, <8, 18, -20.1>}               
                    }//Fim do Difference
       //Botoes
      cylinder {<8, 1, -19.8>, <8, 1, -20.02> 0.6 pigment {color rgb <1, 1, .7>}}
                   object { onoff 
                            pigment {color rgb <.5, .5, .2>}
                            scale <.08, .08, .08>
                            rotate x*-90
                            translate <8, 1, -20.02>
                            }
       cylinder {<7, 1, -19.8>, <7, 1, -20.02> 0.2 pigment {color rgb <1, 1, .7>}}
       cylinder {<6, 1, -19.8>, <6, 1, -20.02> 0.2 pigment {color rgb <1, 1, .7>}}
       cylinder {<5, 1, -19.8>, <5, 1, -20.02> 0.2 pigment {color rgb <1, 1, .7>}}
       cylinder {<4, 1, -19.8>, <4, 1, -20.02> 0.2 pigment {color rgb <1, 1, .7>}}              
       
       //Pé do Monitor
       difference {
                   sphere {<0, -9, -10> 8 pigment {color rgb <1, 1, .8> }
                       normal{bozo 1 scale .008}
                       scale <1, 0.2, 1>}
                  box {<-10, -1.6, 10>, <10, -10, -20> pigment {color rgb <1, 1, .8>} 
                       normal{bozo 1 scale .008}}
                  }//FIm do Difference
       cone {<0, 2, -10> 1, <0, -1, -10> 3 pigment {color rgb <1, 1, .8>} 
            normal{bozo 1 scale .008}}            
       
       //translate pra mover tudo pra cima
       translate <0, 6, 0>             
       }//Fim do union (Monitor)
       /////////////////////////////////////////////FIM DO MONITOR/////////////////////////////////////////////////////////////////
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       /*------------------------------------------------------------------------------------------------------------------------*/
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       ////////////////////////////////////////////////GABINETE////////////////////////////////////////////////////////////////////
       
       union{ //union gabinete
               difference{ //Corpo do Gabinete
                           intersection {box {<-3.5, 0, 0>, <3.5, 25, -40> pigment {color rgb <.8, .8, .6>}
                                                finish{
                                                      conserve_energy
                                                      diffuse 0.6
                                                      ambient 0
                                                      specular 0.2
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}
                                                      }
                                         cylinder {<0, -2, -12>, <0, 30, -12> 16 pigment {color rgb <.8, .8, .6>}
                                                finish{
                                                      conserve_energy
                                                      diffuse 0.6
                                                      ambient 0
                                                      specular 0.2
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}
                                                      }
                                        }//fim do intersection
                           // particionamenndo do leitor de dvd
                           box {<-3, 23, -27>, <3, 20, -29> pigment {color rgb <.9, .9, .8>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}
                                      } 
                           // particionamento do leitor de disquete
                           box {<-3, 16, -27>, <3, 19, -29> pigment {color rgb <.9, .9, .8>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}
                                      }
                           //gap para os botoes power
                           box {<-.8, 10, -27>, <.8, 14, -29> pigment {color rgb <.9, .9, .8>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}
                                      }
                           
                           
                           //entrada de disquete
                           cylinder {<-.7, 17.5, -27>, <.7, 17.5, -27> .5 pigment {color rgb <1, 1, .7>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}}
                           box {<-2.4, 17.4, -20>, <2.4, 17.6, -28> pigment {color rgb <1, 1, .7>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}}
                           //buracos de ar
                           object {buracos
                                     scale <.5, .5, .5>
                                     rotate y*90
                                     translate <-3.505, 15 , -10>}               
                         
                           }// fim do difference dos particionamentos 
              // gaveta dvd
              box{<-2.8, 22.5, -26.9>, <2.8, 21.2, -27.2>
                  pigment {color rgb <.8, .8, .6>}
                                   finish{
                                          conserve_energy
                                          diffuse 0.6
                                          ambient 0
                                          specular 0.2
                                          roughness 0.09}
                                          normal{bozo 1 scale .008}
                                          }
               object {dvd
                        scale <.1, .05, 1> 
                        translate <0, 21.5, -27.21>
                        }
              // botão de abertura dvd
              box {<2, 21, -26.9>, <2.8, 20.5, -27.1> pigment {color rgb <.4, .4, .3>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}}
              //botão de retirada do disquete
              cylinder {<2.2, 17, -26>, <2.2, 17, -27.1> .2 pigment {color rgb <.4, .4, .3>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}} 
            
              
              //botão de ligar gabinete
              torus {.5, .1
                     pigment {color rgb <0, 0, 1>}
                     finish {Metal}
                     rotate x*90
                     translate <0, 11, -27.1>}
             
             cylinder {<0, 11, -26>, <0, 11, -27.1> .4 pigment {color rgb <.4, .4, .3>}
                               finish{
                                      conserve_energy
                                      diffuse 0.6
                                      ambient 0
                                      specular 0.2
                                      roughness 0.09}
                                      normal{bozo 1 scale .008}}
              
              object {onoff
                        scale <.055, .055, .055>
                        rotate x*-90
                        translate <0, 11, -27.1>}//fim do botão ligar
              //lateral
              difference {box {<-3.505, 0.3, -0.01>, <-3.501, 24.7, -26.5> pigment {color rgb <1, 1, .9>}
                                                finish{
                                                      conserve_energy
                                                      diffuse 0.6
                                                      ambient 0.1
                                                      specular 0.7
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}}
                         object {buracos
                                     scale <.5, .5, .5>
                                     rotate y*90
                                     translate <-3.505, 15 , -10>}}
              
              //translate de todo o gabinete    
              translate <30, 0, 0>
              }//fim do union do gabinete
            ////////////////////////////////////////////////////////////FIM DO GABINETE/////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////               
            /*------------------------------------------------------------------------------------------------------------------------*/
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
            ///////////////////////////////////////////////////////////MOUSE////////////////////////////////////////////////////////////       
            union {
                  union {
                         difference {sphere {<0, 0, 0> 3  pigment {color rgb <1, 1, .9>}
                                                                    finish{
                                                                          conserve_energy
                                                                          diffuse 0.4
                                                                          ambient 0.1
                                                                          specular 0.1
                                                                          roughness 0.09}
                                                                          normal{bozo 1 scale .008}}
                                    box {<-10, 0, 10>, <10, -10, -30>}}
                         difference { sphere {<0, 0, 0> 3.01  pigment {color rgb <.8, .8, .7>}
                                                                    finish{
                                                                          conserve_energy
                                                                          diffuse 0.2
                                                                          ambient 0.1
                                                                          specular 0.1
                                                                          roughness 0.09}
                                                                          normal{bozo 1 scale .008}}
                                    box {<-10, 1.7, 10>, <10, -10, -30>}
                                    box {<-10, 30, 0>, <10, -10, -30>}
                                    box {<-0.05, 30, 10>, <0.05, 0, -30>}
                                    }
                        torus {.5, .3 rotate z*90
                                translate <0, 2.3, 1>
                                    pigment {color rgb <.5, .5, .5>}
                                                                    finish{
                                                                          conserve_energy
                                                                          diffuse 0.2
                                                                          ambient 0.1
                                                                          specular 0.1
                                                                          roughness 0.09}
                                                                          normal{bozo 1 scale .008}}     
                        scale <.4, .5, .9>}
           
                        #declare MySpline =
                                  spline {
                                //    linear_spline
                                //    quadratic_spline
                                    cubic_spline
                                     
                                     -2, <0, .3, -3>,
                                     -1, <0, .3, -2>,
                                     0, <0, .3,-1>
                                     1, <0, .3, 1>
                                     2, <-2,0, 2>
                                     3, <0,0, 3>
                                     4, <2,0, 4>
                                     5, <0,0, 5>
                                     6, <-2,0, 6>
                                     7, <0,0, 7>
                                     8, <2,0, 8>
                                     9, <0,0, 9>
                                     10, <-2,0, 10>
                                     11, <0,0, 11>
                                     12, <2,0, 12>
                                     13, <0,0, 13>
                                     14, <-2,0, 14>
                                     15, <0,0, 15>
                                                    }
                      #declare ctr = 0;
                      #declare fio = union {#while (ctr < 15)
                      sphere {
                        MySpline(ctr),.09 // indica o centro e o raio da esfera que representará um ponto na spline
                        pigment { rgb <.4, .4, .4>}
                      }
                      #declare ctr = ctr + 0.001;  // tanto menor, tanto mais esferas aparecerão
                      #end
                      translate <0, .2, 1>
                      }
                      object {fio 
                            scale <1, 1, 3>}
                      translate <15, 0, -35> //Translate pra mover o m0use e o fio
                      } //fim do union do Mouse
        //////////////////////////////////////////////////////////////////FIM DO MOUSE/////////////////////////////////////////////////////       
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////TECLADO///////////////////////////////////////////////////////////
        /////////keycap//////////////////////////////////////////////////////////
        #declare keycap = union{ 
                                   intersection{ 
                                               object{ Pyramid
                                               scale <1,3,1>*1}
                                               box {<-2, -3, -2>, <2, -1.3, 2>}
                                               
                                               }             
                                 box {<-.715, -1.4, -.715>, <.715, -1.3, .715>}
                                 pigment {color rgb <1, 1, .9>}
                                 finish{
                                                      conserve_energy
                                                      diffuse 0.3
                                                      ambient 0.1
                                                      specular 0
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}
                                 translate<0, 2, 0>
                                 }
        ////////////////////////// 3 keycaps em linha////////////////////////////////////////////
        #declare linha3 = union {              
                                  #declare eixoX = -3;
                                  #declare numeroKeycaps = 0;
                                  #while (numeroKeycaps < 3)
                                          object {keycap
                                          translate <eixoX, 0, 0>}
                                          #declare numeroKeycaps = numeroKeycaps + 1;
                                          #declare eixoX = eixoX + 2.1;
                                  #end}
        ////////////////////////// 4 keycaps em linha/////////////////////////////////////////////
        #declare linha4 = union {              
                                  #declare eixoX = -6;
                                  #declare numeroKeycaps = 0;
                                  #while (numeroKeycaps < 4)
                                          object {keycap
                                          translate <eixoX, 0, 0>}
                                          #declare numeroKeycaps = numeroKeycaps + 1;
                                          #declare eixoX = eixoX + 2.1;
                                  #end}                                                   
        ///////////////////////// 12 keycaps em linha/////////////////////////////////////////////              
        #declare linha12 = union {              
                                        #declare eixoX = -12;
                                        #declare numeroKeycaps = 0;
                                        #while (numeroKeycaps < 12)
                                                object {keycap
                                                        translate <eixoX, 0, 0>}
                                                        #declare numeroKeycaps = numeroKeycaps + 1;
                                                        #declare eixoX = eixoX + 2.1;
                                        #end}      
                                        
              #declare keyboard = union{
                                        object {linha12}
                                        object {linha12
                                                    translate <1, 0, -2.1>}
                                        object {linha12
                                                    translate <1.3, 0, -4.2>}
                                        object {linha12
                                                    translate <0.3, 0, -6.3>}
                                        object {keycap
                                                    translate <-14.1, 0, 2.1>}
                                        object {linha4
                                                    translate <-4, 0, 2.1>}
                                        object {linha4
                                                    translate <5.6, 0, 2.1>}           
                                        object {linha4
                                                    translate <15.1, 0, 2.1>}
                                        object {keycap
                                                    translate <-14.1, 0, 0>}            
                                        object {keycap
                                                    scale <1.5, 1, 1>
                                                    translate <-13.6, 0, -2.1>}            
                                        object {keycap
                                                    scale <1.65, 1, 1>
                                                    translate <-13.45, 0, -4.2>}
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <-13.93, 0, -6.3>}            
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <-13.93, 0, -8.4>}            
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <-11.55, 0, -8.4>}            
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <-9.17, 0, -8.4>}
                                        object {keycap
                                                    scale <1.3, 1, 1>
                                                    translate <-6.6, 0, -8.4>} //completar o espaço
                                        object {keycap
                                                    scale <6.8, 1, 1>
                                                    translate <-1.3, 0, -8.4>} //espaço
                                        object {keycap
                                                    scale <1.26, 1, 1>
                                                    translate <4.3, 0, -8.4>} //completar o espaço                                
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <5.7, 0, -8.4>} //completar o espaço
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <8.1, 0, -8.4>}
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <10.48, 0, -8.4>}                               
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <12.86, 0, -8.4>}
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <15.24, 0, -8.4>}
                                        object {keycap
                                                    scale <1.15, 1, 1>
                                                    translate <15.24, 0, -6.3>}
                                        object {keycap
                                                    scale <1.31, 1, 1>
                                                    translate <13.83, 0, -6.3>}                                
                                        object {keycap
                                                    translate <14.5, 0, -4.2>}
                                        object {keycap
                                                    translate <15.4, 0, -4.2>}
                                        object {keycap
                                                    translate <14.5, 0, -3.1>}
                                        object {keycap
                                                    translate <15.4, 0, -3.1>}
                                        object {keycap
                                                    translate <14.2, 0, -2.1>}
                                        object {keycap
                                                    translate <15.4, 0, -2.1>}
                                        object {keycap
                                                    translate <14.2, 0, 0>}
                                        object {keycap
                                                    translate <15.4, 0, 0>}
                                        object {keycap
                                                    translate <13.2, 0, 0>}                        
                                        object {linha3
                                                    translate <21, 0, 2.1>}
                                        object {linha3
                                                    translate <21, 0, 0>}
                                        object {linha3
                                                    translate <21, 0, -2.1>}
                                        object {linha3
                                                    translate <21, 0, -8.4>}
                                        object {keycap
                                                    translate <20.1, 0, -6.3>}            
                                        object {linha4
                                                    translate <31, 0, 0>}
                                        object {linha4
                                                    translate <31, 0, -2.1>}
                                        object {linha4
                                                    translate <31, 0, -4.2>}
                                        object {linha4
                                                    translate <31, 0, -6.3>}
                                        object {linha4
                                                    translate <31, 0, -8.4>}
                                        object {keycap
                                                    translate <31.3, 0, -7>}
                                        object {keycap
                                                    translate <26, 0, -8.4>}
                                        object{
                                        Round_Box(<-15.5,-.9,-10>,<33,-3,4>, 0.25   , 0)  
                                         
                                        pigment {color rgb <.9, .9, .6>}
                                        finish{
                                                      conserve_energy
                                                      diffuse 0.3
                                                      ambient 0.1
                                                      specular 0
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}
                                        scale<1,1,1>  rotate<0, 0,0> translate<0,0.1,0>
                                      }
        
                                       box {<-15, -2, 3>, <-13, -5, 2.5> 
                                           pigment {color rgb <.9, .9, .6>}
                                           finish{
                                                      conserve_energy
                                                      diffuse 0.3
                                                      ambient 0.1
                                                      specular 0
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}}
                                      box {<32.5, -2, 3>, <30.5, -5, 2.5> 
                                            pigment {color rgb <.9, .9, .6>}
                                            finish{
                                                      conserve_energy
                                                      diffuse 0.3
                                                      ambient 0.1
                                                      specular 0
                                                      roughness 0.09}
                                                      normal{bozo 1 scale .008}}
                                      object {fio
                                                translate <-2, -2, 1> 
                                                scale <1, 1, 3>}
                                      translate <-9, 2.9, 10>
                                      rotate x*-5
                                      }
                                        
                                        
              object {keyboard
                        scale <.5, .5, .5>
                        translate <-5, 0, -35>}
       //////////////////////////////////////////////////// FIM DO TECLADO ///////////////////////////////////////////////////////////////////////
       ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       /*---------------------------------------------------------------------------------------------------------------------------------------*/
       ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       ///////////////////////////////////////////////////AREA DE TRABALHO////////////////////////////////////////////////////////////////////////                 
       #declare screen = union{
                        #declare jpgWork = union{
                                                difference{
                                                                   union{box {<-1, -1.5, 0>, <1, 1.5, -.002> pigment {color rgb <1, 1, 1>}}
                                                                        box {<-1.1, -1.6, 0>, <1.1, 1.6, -.001> pigment {color rgb <.2, .2, 1>}}}
                                                                   box {<1, 1, 1>, <-1, -1, -1>
                                                                        rotate z*45
                                                                        translate <1.5, 2, 0>}}
                                                intersection{       
                                                        difference{
                                                                   union{box {<-1, -1.5, 0>, <1, 1.5, -.002> pigment {color rgb <1, 1, 1>}}
                                                                        box {<-1.1, -1.6, 0>, <1.1, 1.6, -.003> pigment {color rgb <.2, .2, 1>}}}
                                                                   box {<1, 1, 1>, <-1, -1, -1>
                                                                        rotate z*45
                                                                        translate <1.5, 2, 0>}}
                                                        box {<1, 1, 1>, <-1, -1, -1> pigment {color rgb <.2, .2, 1>}
                                                             translate <1.5, 2, 0>}}
                                                 box {<-.5, -.5, -0.002>, <.5, .5, -0.003> pigment {color rgb <.7, .2, 0>}}
                                                 
                                                 difference {
                                                             box {<-.5, -.5, -0.002>, <.5, .5, -0.004> pigment {color rgb <.1, .2, 1>}}
                                                             box {<-1, .1, -0.002>, <1, .7, -0.005> pigment {color rgb <.7, .2, 0>} rotate z*5}
                                                             }
                                                 difference {cone {<-.3, -.1, -0.002> .1, <-.4, .3, -0.002> 0 pigment {color rgb <.3, .1, 0>}}
                                                             box {<-1, -1.5, -4>, <1, 1.5, -.005> pigment {color rgb <.3, .1, 0>}}}
                                                 difference {cylinder {<-.298, -.1, 0>, <-.298, -.1, -0.006> 0.1 pigment {color rgb <.3, .1, 0>}}
                                                             box {<-3, -.1, 1>, <3, 3, -3>}
                                                             rotate z*15
                                                             translate <-.02, .02, 0>}
                                                 cylinder {<.35, .35, 0>, <.35, .35, -0.006> 0.1 pigment {color rgb <.9, .7, .5>}}
                                                 
                                                 text { ttf "tahoma.ttf" "wonderfulview.jpg" 0.2, 0
                                                 pigment { color rgb <0, 0, 0> }
                                                 scale <.5,.5,.5>
                                                 translate <-2, -2.5, -.006>}
                                                 }
                                                 
                        object {jpgWork
                                translate <-17, 17, 0>}
                        
                        box{<-20, -20, .1>, <20, 20, 0> pigment {color rgb <.1, .5, 1>}}
                        intersection {cylinder {<-10, -75, 0>, <-10, -75, -.003> 70}
                                      box{<-20, -20, .1>, <20, 20, -1>} 
                                      pigment {color rgb <0, .3, .01>} normal {bumps .3}
                                      }
                        intersection {cylinder {<10, -70, 0>, <10, -70, -.002> 70}
                                      box{<-20, -20, .1>, <20, 20, -1>}
                                      pigment {color rgb <0, .15, .01>} normal {bumps .6}
                                      }
                        box{<-20, -20, .1>, <20, -17, -0.004> pigment {color rgb <0, .2, 1>}}
                        
                        intersection {cylinder {<-17, -18.5, 0>, <-17, -18.5, -0.005> 4 pigment {color rgb <0, .3, .1>}}
                                      box{<-20, -20, .1>, <20, -17, -0.006>}}
                        
                        box{<-19.5, -18.4, .1>, <-18.8, -17.6, -0.006> pigment {color rgb <.7, .1, .1>}}
                        box{<-19.5, -18.5, .1>, <-18.8, -19.3, -0.006> pigment {color rgb <.1, .1, .7>}}
                        box{<-18, -18.4, .1>, <-18.7, -19.2, -0.006> pigment {color rgb <.6, .6, .1>}}
                        box{<-18, -18.3, .1>, <-18.7, -17.5, -0.006> pigment {color rgb <.1, .5, .1>}}
                        
                        text { ttf "tahoma.ttf" "Start" 0.2, 0
                                                 pigment { color rgb <1, 1, 1> }
                                                 scale <1.2,1.2,1.2>
                                                 translate <-17, -19, -.007>} 
                                                 
                        #declare clouds = union{
                                                cylinder {<16, 15, 0>, <16, 15, -.005> 2 pigment {color rgbf <1, 1, 1, .89>}}
                                                cylinder {<14, 15, 0>, <14, 15, -.005> 3 pigment {color rgbf <1, 1, 1, .90>}}
                                                cylinder {<14, 13, 0>, <14, 13, -.005> 2 pigment {color rgbf <1, 1, 1, .90>}}
                                                cylinder {<12, 13, 0>, <12, 13, -.005> 2 pigment {color rgbf <1, 1, 1, .89>}}
                                                cylinder {<11, 15, 0>, <11, 15, -.005> 2 pigment {color rgbf <1, 1, 1, .89>}} 
                                                translate <0, 0, 0> scale <3, 1, 1> translate <-15, -10, -.005>}
                                                
                        object {clouds
                                translate <-32, 2, 0>}   
                        object {clouds
                                translate <-15, 10, 0>}
                        object {clouds
                                translate <-20, 0, 0>}
                        text { ttf "tahoma.ttf" "09/11/2001" 0.2, 0
                                                 pigment { color rgb <1, 1, 1> }
                                                 scale <.6,.6,.6>
                                                 translate <16, -18, -.007>}
                        text { ttf "tahoma.ttf" "08:46 AM" 0.2, 0
                                                 pigment { color rgb <1, 1, 1> }
                                                 scale <.6,.6,.6>
                                                 translate <16, -19, -.007>}
                        }//fim do declare da Area de Trabalho
       /*object {screen
                scale <.4, .4, .4>
                translate <0, 16, -19.8>}*/ ///Chama a tela de Area de trabalho
       /////////////////////////////////////////Fim da Area de Trabalho////////////////////////////////////////////////////////////////////////////
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       /*----------------------------------------------------------------------------------------------------------------------------------------*/
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       ///////////////////////////////////////////////////Janela aberta////////////////////////////////////////////////////////////////////////////                 
       #declare screenWindow = union {   
                               #declare jpgicon = union{
                                                                            difference{
                                                                                               union{box {<-1, -1.5, 0>, <1, 1.5, -.002> pigment {color rgb <1, 1, 1>}}
                                                                                                    box {<-1.1, -1.6, 0>, <1.1, 1.6, -.001> pigment {color rgb <.2, .2, 1>}}}
                                                                                               box {<1, 1, 1>, <-1, -1, -1>
                                                                                                    rotate z*45
                                                                                                    translate <1.5, 2, 0>}}
                                                                            intersection{       
                                                                                    difference{
                                                                                               union{box {<-1, -1.5, 0>, <1, 1.5, -.002> pigment {color rgb <1, 1, 1>}}
                                                                                                    box {<-1.1, -1.6, 0>, <1.1, 1.6, -.003> pigment {color rgb <.2, .2, 1>}}}
                                                                                               box {<1, 1, 1>, <-1, -1, -1>
                                                                                                    rotate z*45
                                                                                                    translate <1.5, 2, 0>}}
                                                                                    box {<1, 1, 1>, <-1, -1, -1> pigment {color rgb <.2, .2, 1>}
                                                                                         translate <1.5, 2, 0>}}
                                                                             box {<-.5, -.5, -0.002>, <.5, .5, -0.003> pigment {color rgb <.7, .2, 0>}}
                                                                             
                                                                             difference {
                                                                                         box {<-.5, -.5, -0.002>, <.5, .5, -0.004> pigment {color rgb <.1, .2, 1>}}
                                                                                         box {<-1, .1, -0.002>, <1, .7, -0.005> pigment {color rgb <.7, .2, 0>} rotate z*5}
                                                                                         }
                                                                             difference {cone {<-.3, -.1, -0.002> .1, <-.4, .3, -0.002> 0 pigment {color rgb <.3, .1, 0>}}
                                                                                         box {<-1, -1.5, -4>, <1, 1.5, -.005> pigment {color rgb <.3, .1, 0>}}}
                                                                             difference {cylinder {<-.298, -.1, 0>, <-.298, -.1, -0.006> 0.1 pigment {color rgb <.3, .1, 0>}}
                                                                                         box {<-3, -.1, 1>, <3, 3, -3>}
                                                                                         rotate z*15
                                                                                         translate <-.02, .02, 0>}
                                                                             cylinder {<.35, .35, 0>, <.35, .35, -0.006> 0.1 pigment {color rgb <.9, .7, .5>}}
                                                                             
                                                                             scale <.5,.5,.5>}
                                                                             
                               box{<-20, -20, .15>, <20, 20, .01> pigment {color rgb <0, 0, 0>}}
                               difference {box{<-20, -20, .1>, <20, 20, -0.001> pigment {color rgb <0, .4, 1>}}
                                           box{<-19.5, -17, 1>, <19.5, 18, -2> pigment {color rgb <0, 0, 0>}}
                                           } 
                               box{<-20, -20, .1>, <20, -17, -0.004> pigment {color rgb <0, .2, 1>}}
                                                    
                                                    intersection {cylinder {<-17, -18.5, 0>, <-17, -18.5, -0.005> 4 pigment {color rgb <0, .3, .1>}}
                                                                  box{<-20, -20, .1>, <20, -17, -0.006>}}
                                                    
                                                    box{<-19.5, -18.4, .1>, <-18.8, -17.6, -0.006> pigment {color rgb <.7, .1, .1>}}
                                                    box{<-19.5, -18.5, .1>, <-18.8, -19.3, -0.006> pigment {color rgb <.1, .1, .7>}}
                                                    box{<-18, -18.4, .1>, <-18.7, -19.2, -0.006> pigment {color rgb <.6, .6, .1>}}
                                                    box{<-18, -18.3, .1>, <-18.7, -17.5, -0.006> pigment {color rgb <.1, .7, .1>}}
                                                    
                                                    text { ttf "tahoma.ttf" "Start" 0.2, 0
                                                                             pigment { color rgb <1, 1, 1> }
                                                                             scale <1.2,1.2,1.2>
                                                                             translate <-17, -19, -.007>} 
                                                                             
                                                    text { ttf "tahoma.ttf" "09/11/2001" 0.2, 0
                                                                             pigment { color rgb <1, 1, 1> }
                                                                             scale <.6,.6,.6>
                                                                             translate <16, -18, -.007>}
                                                    text { ttf "tahoma.ttf" "08:46 AM" 0.2, 0
                                                                             pigment { color rgb <1, 1, 1> }
                                                                             scale <.6,.6,.6>
                                                                             translate <16, -19, -.007>}
                                difference{box {<19.5, 19.8, 0>, <17.8, 18.3, -0.003> pigment {color rgb <1, 1, 1>}}
                                            box {<19.4, 19.7, 0>, <17.9, 18.4, -0.006> pigment {color rgb <1, 1, 1>}}}
                                box {<19.5, 19.8, 0>, <17.8, 18.3, -0.002> pigment {color rgb <.9, .1, .1>}}
                                
                                difference{box {<19.5, 19.8, 0>, <17.8, 18.3, -0.003> pigment {color rgb <1, 1, 1>}}
                                            box {<19.4, 19.7, 0>, <17.9, 18.4, -0.006> pigment {color rgb <1, 1, 1>}}
                                            translate <-2, 0, 0>}
                                box{<-.5, -.06, 0>, <.5, .06, -.003> pigment {color rgb <1, 1, 1>}
                                    rotate z*45
                                    translate <18.65, 19, 0>}
                                box{<-.5, -.06, 0>, <.5, .06, -.003> pigment {color rgb <1, 1, 1>}
                                    rotate z*-45
                                    translate <18.65, 19, 0>} 
                                box{<-.5, -.06, 0>, <.5, .06, -.003> pigment {color rgb <1, 1, 1>}
                                    translate <14.6, 18.7, 0>}
                                difference{box {<19.5, 19.8, 0>, <17.8, 18.3, -0.003> pigment {color rgb <1, 1, 1>}}
                                            box {<19.4, 19.7, 0>, <17.9, 18.4, -0.006> pigment {color rgb <1, 1, 1>}}
                                            scale <.5, .5, .5>
                                            translate <7.3, 9.5, 0>}            
                                difference{box {<19.5, 19.8, 0>, <17.8, 18.3, -0.003> pigment {color rgb <1, 1, 1>}}
                                            box {<19.4, 19.7, 0>, <17.9, 18.4, -0.006> pigment {color rgb <1, 1, 1>}}
                                            translate <-4, 0, 0>}
                                #declare windowName = union {
                                                            object {jpgicon
                                                                           translate <-19, 19, -0.002>}
                                                                    text { ttf "tahoma.ttf" "wonderfulview.jpg" 0.2, 0
                                                                                                         pigment { color rgb <0, 0, 0> }
                                                                                                         scale <.7,.7,.7>
                                                                                                         translate <-18, 18.8, -.006>}}
                                object {windowName}
                                box {<-12, -19.5, 0>, <-4, -17.5, -0.004> pigment {color rgb <0, .4, .9>}}
                                object {windowName
                                        scale <.8, .8, .8>
                                        translate <4, -33.7, -0.002>}
                                
                                ##declare jump = union {
                                                        box{<-19.5, -17, 1>, <19.5, 18, -0.006> pigment
                                                            {image_map
                                                            {jpeg "wonderfulview1.jpeg"
                                                            map_type 0}
                                                            scale <40, 40, 40>
                                                            translate <-20, 18, 0>}
                                                            }}
                                //object {jump}///Chama o jump
                                }
       /*object {screenWindow
                scale <.4, .4, .4>
                translate <0, 16, -19.8>}*/ ///Chama a Janela aberta
       /////////////////////////////////////////Fim da Janela Aberta////////////////////////////////////////////////////////////////////////////
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       /*----------------------------------------------------------------------------------------------------------------------------------------*/
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       ///////////////////////////////////////////////////Boot Loading////////////////////////////////////////////////////////////////////////////  
       #declare boot = union {
                                difference {box{<-20, -20, .15>, <20, 20, -.0015> pigment {color rgb <0, 0, 0>}} 
                                            object{
                                                   Round_Box(<-10.8,-5.2, 0>,<10.8,-6.8,-0.1>, 0.25   , 0)                                           
                                                    pigment {color rgb <0, 0, 0>}}}
                                union{        
                                        box{<-4, 4.1, .1>, <-0.2, 0.3, -0.006> pigment {color rgb <.7, .1, .1>}} //red
                                        box{<-4, 0, .1>, <-0.2, -3.8, -0.006> pigment {color rgb <0, .1, .7>}} //blue
                                        box{<0, -0.3, .1>, <3.8, -4.1, -0.006> pigment {color rgb <.6, .6, .1>}} //yellow
                                        box{<0, 3.8, .1>, <3.8, 0, -0.006> pigment {color rgb <.1, .7, .1>}} //green
                                        translate <2, 6, 0>}
                                text { ttf "tahoma.ttf" "Microsoft" 0.2, 0
                                       pigment { color rgb <1, 1, 1> }
                                       scale <2,2,2>
                                       translate <-12, 1, -.002>}
                                text { ttf "tahoma.ttf" "Windows" 0.2, 0
                                       pigment { color rgb <1, 1, 1> }
                                       scale <5,5,5>
                                       translate <-12, -4, -.002>}
                                text { ttf "tahoma.ttf" "xp" 0.3, 0
                                       pigment { color rgb <.7, .1, .1> }
                                       scale <4,4,4>
                                       translate <8.8, -2, -.002>}
                                text { ttf "tahoma.ttf" "Copyright Microsoft Corporation" 0.3, 0
                                       pigment { color rgb <1, 1, 1> }
                                       scale <1,1,1>
                                       translate <-19, -19, -.002>}
                                text { ttf "tahoma.ttf" "Microsoft" 0.3, 0
                                       pigment { color rgb <1, 1, 1> }
                                       scale <1,1,1>
                                       translate <15, -19, -.002>}        
                                 difference{
                                            object{
                                                   Round_Box(<-11,-5, 0>,<11,-7,-0.01>, 0.25   , 0)                                           
                                                    pigment {color rgb <1, 1, 1>}}
                                            object{
                                                   Round_Box(<-10.8,-5.2, 0>,<10.8,-6.8,-0.1>, 0.25   , 0)                                           
                                                    pigment {color rgb <0, 0, 0>}}}
                                 #declare carrega = union{ difference {sphere {<-10, -6, -0.01> .6 pigment {color rgb <0, .2, 1>}}
                                                                       box {<-15, -3, 0>, <15, -9, -2> pigment {color rgb <0, .2, 1>}}}
                                                           difference {sphere {<-9, -6, -0.01> .6 pigment {color rgb <0, .2, 1>}}
                                                                box {<-15, -3, 0>, <15, -9, -2> pigment {color rgb <0, .2, 1>}}}
                                                           difference {sphere {<-8, -6, -0.01> .6 pigment {color rgb <0, .2, 1>}}
                                                                box {<-15, -3, 0>, <15, -9, -2> pigment {color rgb <0, .2, 1>}}}
                                                                }     
                                 
                                       
                                 #declare MySpline =
                                    spline {
                                       linear_spline
                                       
                                       0, <-4, 0, -0.001>,
                                       2, <55, 0, -0.001>,} 
                                 
                        
                                 object{carrega 
                                          translate MySpline(clock)}}   
        object {boot scale <.4, .4, .4> translate <0, 16, -19.8>} ///chama a tela de boot
       }//Fim do union do PC

        #declare caixaL =
                            union{  //corpo da caixa
                                    intersection{ 
                                                 object{
                                                        Round_Box(<-1.5,-1,0>,<1.5,9,-4>, 0.25   , 0)                               
                                                        pigment{ color rgb<.8,0.8,.6>} normal {bozo 1 scale .0007}}
                                                 object{
                                                        Round_Box(<-1.5,-2,3>,<1.5,10,-4.29>, 0.25   , 0)                               
                                                        pigment{ color rgb<.8,0.8,.6>} normal {bozo 1 scale .007}
                                                        rotate x*10}}
                                    //Speaker de "tecido"
                                    intersection { 
                                                 union{
                                                         object{
                                                                 Round_Box(<-1.6,2.4,-2>,<1.6,9.1,-8>, 0.25   , 0)                                             
                                                                            pigment{ color rgb<.1,.1,.1>}  normal {bumps .4 scale <.2, .2, .2>}}
                                                         cylinder {<0, 3.2, -2>, <0, 3.2, -8> 2 
                                                                 pigment{color rgb<.1,.1,.1>} normal{bumps .4 scale <.2, .2, .2>}}}        
                                                 object{
                                                        Round_Box(<-1.51,-2,3>,<1.51,10,-4.3>, 0.25   , 0)                               
                                                                  pigment{ color rgb<.2,.2,.2>}  normal {bumps .4 scale <.2, .2, .2>}
                                                                  rotate x*10
                                                 }}} 
                                    
          #declare caixaR = union {//Entrada de fone
                                   difference {                            
                                            object {caixaL}
                                            cylinder {<.7, 0, -3.9>, <.7, 0, -5> .3 pigment{ color rgb<.7,.7,.4>}}
                                            cylinder {<.7, 0, -2>, <.7, 0, -6> .1}}
                                   difference {cylinder {<.7, 0, -2>, <.7, 0, -4> .13 pigment {color rgb <.06, .06, .06>}}         
                                               cylinder {<.7, 0, -2>, <.7, 0, -6> .06}}
                                   //Simbolo de fone de ouvido
                                   union{
                                         difference {
                                                     torus {5, .5 pigment {color rgb <.06, .06, .06>} rotate x*90}
                                                     box {<-10, -3, -10>, <10, -10, 10>}} //arco
                                                     object{Round_Box(<-4.5,  -.5, -.2>,<-3, -5.5, .2>, 0.72 , 0) pigment {color rgb <.06, .06, .06>}} //ear cup esquerda
                                                     object{Round_Box(<4.5,  -.5, -.2>,<3, -5.5, .2>, 0.72 , 0) pigment {color rgb <.06, .06, .06>}} scale <.02, .02, .03> translate <.7, -.5, -3.99>}//ear cup direita                    
                                   //potenciometro de Volume
                                   cone {<0, 0, -4> .3, <-0, 0, -4.6> .2  pigment {color rgb <.66, .66, .46>}
                                                             normal {radial poly_wave frequency 25 scale .3  turbulence 0 rotate<90,0,0>}} 
                                   cylinder {<0, 0, -4.599>,<0, 0, -4.601> .2  pigment {color rgb <.66, .66, .46>}}                                    
                                   box{<0, -.01, -4.2>, <.2, .01, -4.602> rotate z*-45}
                                   //indicador de curva de altura
                                   difference {torus {.35, .015 pigment {color rgb <.06, .06, .06>} rotate x*90}
                                                           box {<-1, -.25, -1>, <1, -1, 1>} scale <1, 1, .01> translate <0, 0, -4.01>}
                                   
                                   //Simbolos de - e + do volume
                                   union {box{<-.05, -.01, -4>, <.05, .01, -4.01>}
                                          box{<-.05, -.01, -4>, <.05, .01, -4.01> rotate z*90} translate <.2, -.3, 0>}
                                          box{<-.05, -.01, -4>, <.05, .01, -4.01> translate <-.2, -.3, 0>}
                                   
                                   cylinder{<-.7, 0, -4>, <-.7, 0, -4.2> .2  pigment {color rgb <.76, .76, .36>}} //Botão power
                                   cylinder{<-.7, -.3, -4>, <-.7, -.3, -4.1> .06  pigment {color rgb <.05, .66, .05>}} //luz piloto                       
                                   }
                    
                    
         object {caixaR
                translate <22, 0, 0>}
         
         object {caixaL
                translate <-22, 0, 0>}                    
                     
                
                     