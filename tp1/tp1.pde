// inicio de codigo ----------------------------------------------------------- 
 PImage mi_imagen; // variable de la imagen

void setup (){

 mi_imagen=loadImage("MiImagen.jpg");

  background(150);
  size (800,400); // tama;o de lienzo

}

//-----------------------------------------------------------------------------

void draw (){
  
  background(150);
  image (mi_imagen,0,0); // imagen de ejemplo a la izquierda
  
  noStroke();
  
  fill(190);
  ellipse(590,172,290,350);
  
  //velo
  beginShape();
  vertex(535,71);
  vertex(450,121);
  vertex(400,260);
  vertex(400,400);
  endShape();
  
  fill(40); //parte oscura del velo
  ellipse(640,200,280,400);
  triangle(770,180,800, 400, 640, 400);
  
  //cara
  fill(190);
  ellipse(610,183,210,300);
  rect(515,190,200,100);
  fill(80);
  triangle(513,274,661,246,716,291);
  triangle(513,273,563,400,716,290);
  rect(471,312,200,100);
  
  //expresion (utilizo vertex para los detalles como sombras y ojos)
  
  //sombra de cejas
  beginShape();
  vertex(604,76);
  vertex(526,88);
  vertex(512,117);
  vertex(515,149);
  vertex(604,123);
  endShape();
  
  beginShape();
  vertex(656,79);
  vertex(663,123);
  vertex(710,150);
  vertex(700,107);
  endShape();
  
  //nariz
  fill(40);
  triangle(657,160,629,186,673,186);
  fill(230);
  beginShape();
  vertex(646,170);
  vertex(663,170);
  vertex(662,128);
  vertex(657,107);
  vertex(637,106);
  vertex(642,130);
  endShape();
  
  //ojos
  ellipse(580,121,50,25);
  ellipse(680,124,40,20);
  fill(40);
  ellipse(580,115,25,17); 
  ellipse(674,120,20,15);
  
  //boca
  fill(80);
  beginShape();
  vertex(687,224);
  vertex(673,200);
  vertex(642,200);
  vertex(617,224);
  endShape();
  
  fill(230);
  beginShape();
  vertex(617,224);
  vertex(646,216);
  vertex(670,216);
  vertex(686,224);
  endShape();
  
  //velo
  fill(80);
  triangle(513,114,491,215,531,319);
  fill(90);
  triangle(505,151,400,400,468,400);
  fill(140);
  triangle(494,222,468,399,562,400);
  
  //detalles finales
  fill(80);
  triangle(569,108,551,129,540,117);
  triangle(685,112,700,127,702,112);

}
//fin de codigo----------------------------------------------------------------
