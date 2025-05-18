//variables -------------------------------------------------

PImage[] imagenes = new PImage[7];
String[] parrafos = new String[7];
int indice = 0;
int intervalo = 10000;
int ultimoCambio = 0;
int inicioMensaje;

PFont miFuente;

float tamanoTexto = 5;
float tamanoMaximo = 38;
float xTexto, yTexto;
float opacidadTexto = 0;


int botonX = 40;
int botonY = 400;
int botonW = 140;
int botonH = 40;

void setup() {
  size(640, 480);

  for (int i = 0; i < imagenes.length; i++) {
    imagenes[i] = loadImage("chiikawa" + i + ".png");
  }

    parrafos[0] = "";
    parrafos[1] = " chiikawa es un anime japones creado por el mangaka nanage como un metodo de escapismo del mundo adulto, en donde expresa como quiere ser una criatura pequeña y adorable que come y llora todo el dia.";
    parrafos[2] = "este anime muestra las aventuras del personaje de chiikawa y sus amigos viviendo su vida cotidiana en un universo donde todos son adorables y casi todo es perfecto  .";
    parrafos[3] = "si bien el anime es un slice of life, tambien tiene algunos aspectos de comedia que lo vuelven mas entretenido para algunas personas.";
    parrafos[4] = "al ser un anime hecho especificamente como un metodo de escapismo del mundo adulto, varias personas se sintien identificadas con los personajes y sus aventuras, sintiendo cierto tipo de comfort en estos.";
    parrafos[5] = "esto hizo que este anime explote en popularidad de forma internacional, y esto se ve por la cantidad de mercancia oficial que se puede ver en tiendas de casi todo el mundo.";
    parrafos[6] = "";

    inicioMensaje = millis();
    ultimoCambio = millis();
    iniciarAnimacionTexto();


    miFuente = loadFont("Leelawadee-Bold-48.vlw");
    textFont(miFuente);
}


void draw() {
  
  if (millis() - ultimoCambio > intervalo) {
      indice = (indice + 1) % imagenes.length;
      ultimoCambio = millis();
      tamanoTexto = 5;
      iniciarAnimacionTexto();
   }

  image(imagenes[indice], 0, 0, width, height);

  textSize(tamanoTexto);
  textLeading(tamanoTexto * 1.2);
  textAlign(LEFT, TOP);

  //animaciones
  if (indice == 0) {
    if (tamanoTexto < tamanoMaximo) tamanoTexto += 0.5;
    fill(255);
  } else if (indice == 1) {
    if (yTexto < height / 2) yTexto += 2;
    fill(122, 22, 24);
  } else if (indice == 2) {
    if (xTexto > width / 2 - 250) xTexto -= 2;
    fill(122, 22, 24);
  } else if (indice == 3) {
    if (opacidadTexto < 255) opacidadTexto += 3;
    fill(122, 22, 24, constrain(opacidadTexto, 0, 255));
  } else if (indice == 4) {
    if (yTexto > height / 2) yTexto -= 2;
    fill(122, 22, 24);
  } else if (indice == 5) {
    if (yTexto < height / 2) yTexto += 2;
    fill(122, 22, 24);
  }

  if (parrafos[indice] != null) {
    drawTextWithParagraphWrap(parrafos[indice], xTexto, yTexto, width - 60, height / 2);
  }

  // boton
  if (indice == 6) {
    boolean sobreBoton = mouseX > botonX && mouseX < botonX + botonW && mouseY > botonY && mouseY < botonY + botonH;

    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(botonX, botonY, botonW, botonH, 8);

    fill(255);
    textSize(18);
    textAlign(CENTER, CENTER);
    text("Reiniciar", botonX + botonW / 2, botonY + botonH / 2);
  }
}

void drawTextWithParagraphWrap(String texto, float x, float y, float w, float h) {
  textAlign(LEFT, TOP);
  float lineHeight = tamanoTexto * 1.3;
  float currentY = y;
  String[] words = splitTokens(texto, " \n");
  String line = "";

  for (int i = 0; i < words.length; i++) {
    String testLine = line + words[i] + " ";
    float testWidth = textWidth(testLine);

    if (testWidth > w) {
      text(line, x, currentY);
      currentY += lineHeight;
      line = words[i] + " ";
    } else {
      line = testLine;
    }

    if (currentY + lineHeight > y + h) break;
  }

  text(line, x, currentY);
}

void iniciarAnimacionTexto() {
  if (indice == 0) {
    tamanoTexto = 8;
    xTexto = 50;
    yTexto = height / 2;
  } else if (indice == 1) {
    tamanoTexto = 25;
    yTexto = -50;
  } else if (indice == 2) {
    tamanoTexto = 20;
    xTexto = width + 150;
  } else if (indice == 3) {
    tamanoTexto = 22;
    xTexto = 50;
    yTexto = height / 2;
    opacidadTexto = 0;
  } else if (indice == 4) {
    tamanoTexto = 24;
    xTexto = 50;
    yTexto = height + 100;
  } else if (indice == 5) {
    tamanoTexto = 24;
    yTexto = -50;
  } else if (indice == 6) {
    tamanoTexto = 24;
    xTexto = 50;
    yTexto = height / 2;
  }
}

void mousePressed() {
  if (indice == 8) {
    if (mouseX > botonX && mouseX < botonX + botonW && mouseY > botonY && mouseY < botonY + botonH) {
      indice = 0;
      ultimoCambio = millis();
      iniciarAnimacionTexto();
    }
  }
}
