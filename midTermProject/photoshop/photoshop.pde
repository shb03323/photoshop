ColorPicker cp;
PGraphics pg1;
PGraphics pg2;

int colorR = 0;
int colorG = 0;
int colorB = 0;
color clr = color(colorR, colorG, colorB);
int bolding = 3;
int brighting = 127;
int mode = 0;
int saveFile = 0;
int getImage = 0;
int colorPick = 0;
int mySwitch = 0;
int currentLayer = 2;
String str = "";

void setup() {
  size(1500,1000);
  background(70);
  fill(150);
  noStroke();
  rect(0,0,width,40);
  rect(0,0,40,height);
  
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(200,200,500,700);
  
  cp = new ColorPicker(1000, 200, 400, 400, 255);
  
  pg1 = createGraphics(width,height);
  pg2 = createGraphics(width,height);
  
  PFont font1;
  font1 = loadFont("ComicSansMS-48.vlw");
  textFont(font1, 12);
  
  /*upper menu*/
  stroke(0);
  strokeWeight(2);
  fill(255);
  
  //save
  PImage save;
  save = loadImage("save.png");
  rect(5,5,30,30);
  image(save, 5, 5, 30, 30);
  
  //page
  PImage page;
  page = loadImage("page.png");
  rect(45,5,30,30);
  image(page, 45,5,30,30);
  
  //imageFile
  PImage imageFile;
  imageFile = loadImage("imageFile.png");
  rect(85, 5, 30, 30);
  image(imageFile, 85, 5, 30, 30);
  
  //color
  String currentColor;
  currentColor = "color : ";
  text(currentColor, 190, 25);
  String r;
  r = "R";
  text(r, 230, 25);
  String g;
  g = "G";
  text(g, 250, 25);
  String b;
  b = "B";
  text(b, 270, 25);
  plusButton(234,7, 12);
  minusButton(234, 33, 12);
  plusButton(254, 7, 12);
  minusButton(254, 33, 12);
  plusButton(274, 7, 12);
  minusButton(274, 33, 12);
  fill(clr);
  rect(140, 5, 40, 30);
  
  //thikness
  String thick;
  thick= "thickness";
  fill(255);
  text(thick, 350, 25);
  rect(300, 5, 40, 30);
  strokeWeight(bolding);
  line(310, 20, 330, 20);
  plusButton(415,20,20);
  minusButton(440,20,20);
  
  //brightness
  String bright;
  bright = "brightness";
  fill(255);
  text(bright, 520, 24);
  tint(brighting);
  rect(470, 5, 40, 30);
  plusButton(595,20,20);
  minusButton(620,20,20);
  
  /*left menu*/
  //pencil
  PImage pencil;
  pencil = loadImage("pencil.png");
  rect(5, 45, 30, 30);
  image(pencil, 5, 45, 30, 30);
  
  //brush
  PImage brush;
  brush = loadImage("brush.png");
  rect(5, 85, 30, 30);
  image(brush, 5, 85, 30, 30);
  
  //text
  PImage text;
  text = loadImage("text.png");
  rect(5, 125, 30, 30);
  image(text, 10, 130, 20, 20);
  
  //figure
  rect(5, 165, 30, 30);
  strokeWeight(1);
  circle(18, 178, 20);
  line(15, 175, 15, 190);
  line(15, 190, 30, 190);
  line(30, 190, 30, 175);
  line(30, 175, 15, 175);
  
  //eraser
  PImage eraser;
  eraser = loadImage("eraser.png");
  strokeWeight(1);
  rect(5, 205, 30, 30);
  image(eraser, 5, 205, 30, 30);
  
  /*layer*/
  //layer
  strokeWeight(1);
  stroke(0);
  fill(100);
  rect(830,680,40,20);
  String layer;
  layer = "Layer";
  textSize(14);
  fill(0);
  text(layer, 833, 695);
  
  //image layer
  fill(200);
  rect(800, 700, 100, 50);
  String imageLayer;
  imageLayer = "Image";
  textSize(20);
  fill(0);
  text(imageLayer, 820, 730);
  
  //painting layer
  fill(200);
  rect(800, 750, 100, 50);
  String paintingLayer;
  paintingLayer = "Painting";
  textSize(20);
  fill(0);
  text(paintingLayer, 815, 780);
  
  /*logo*/
  PFont logoFont;
  logoFont = loadFont("Gigi-Regular-48.vlw");
  textFont(logoFont, 30);
  fill(255,255,0);
  String myLogo;
  myLogo = "Hooni Photoshop";
  text(myLogo,1250,30);
  
  simpleFont();
}

void draw() {
  
  //layer
  if (currentLayer == 1) {
    pg1.beginDraw();
    pg1.endDraw();
  }
  else if (currentLayer == 2) {
    pg2.beginDraw();
    pg2.endDraw();
  }
  //save button
  if(saveFile==1) {
    stroke(1);
    fill(100);
    rect(600,400,400,200);
    fill(255);
    rect(980,400,20,20);
    line(980,400,1000,420);
    line(980,420,1000,400);
    noStroke();
    rect(750,485,150,20);
    String save;
    save = "Enter a file name: ";
    textSize(15);
    text(save, 620, 500);
    stroke(1);
    fill(255,255,0);
    rect(780, 550, 40, 20);
    String OK;
    fill(0);
    OK = "SAVE";
    text(OK, 785, 565);
    
    //quit button
    if(mousePressed && 980<=mouseX && mouseX<=1000 && 400<=mouseY && mouseY<=420) {
      saveFile=0;
      mySwitch=1;
    }
    
    //save button
    if(mousePressed && 780<=mouseX && mouseX<=820 && 550<=mouseY && mouseY<=570) {
      saveFile=0;
      mySwitch=1;
      saveFrame(str + ".jpg");
    }
    //keyPressed here
  }
  if(saveFile==0 && mySwitch==1) {
    mySwitch=0;
    setup();
  }
  
  //new page
  if(mousePressed && 45<=mouseX && mouseX<=75 && 5<=mouseY && mouseY<=35) {
    setup();
  }
  
  //get image
  if(getImage==1) {
    stroke(1);
    fill(100);
    rect(600,400,400,200);
    fill(255);
    rect(980,400,20,20);
    line(980,400,1000,420);
    line(980,420,1000,400);
    noStroke();
    rect(780,485,150,20);
    String imageGet;
    imageGet = "Enter a image name: ";
    textSize(15);
    text(imageGet, 620, 500);
    stroke(1);
    fill(255,255,0);
    rect(775, 548, 50, 20);
    String load;
    fill(0);
    load = "LOAD";
    text(load, 782, 565);
    
    //quit button
    if(mousePressed && 980<=mouseX && mouseX<=1000 && 400<=mouseY && mouseY<=420) {
      getImage=0;
      setup();
    }
    
    //load button
    if(mousePressed && 775<=mouseX && mouseX<=825 && 548<=mouseY && mouseY<=568) {
      getImage=0;
      mySwitch=1;
    }
  }
  if(getImage==0 && mySwitch==1) {
    mySwitch=0;
    setup();
    PImage loadImage;
    loadImage = loadImage(str);
    image(loadImage, 300, 300, 300, 300);
  }
  
  //color button
  if(colorPick==1) {
    stroke(0);
    strokeWeight(1);
    cp.render();
    if(mousePressed && 1000<=mouseX && mouseX<=1400 && 200<=mouseY && mouseY<=400) {
      colorPick=0;
      //setup();
    }
  }
  
  /*mode*/
  //pencil
  if(mode==0) {
    strokeWeight(bolding);
    stroke(clr);
  }
  
  //brush
  if(mode==1) {
    //strokeWeight(bolding);
    stroke(clr);
  }
  
  //text
  if(mode==2) {
    noStroke();
  }
  //eraser
  if(mode==4) {
    strokeWeight(20);
    stroke(255);
  }
}

void keyPressed() {
  //save file name
  if (saveFile==1 && mySwitch==0) {
    if (key == BACKSPACE) {
      str = "";
      return;
    }
    str += key;
    text(str, 800, 500);
  }
  
  //get image file
  if(getImage==1 && mySwitch==0) {
    if(key == BACKSPACE) {
      str = "";
      return;
    }
    str += key;
    text(str, 800, 500);
  }
  
  //text mode
  if(mode==2) {
    String textInput;
    textInput = "";
    if(200<=mouseX && mouseX<=700 && 200<mouseY && mouseY<=900) {
      textInput += key;
      text(textInput, mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  //save
  if(5<=mouseX && mouseX<=35 && 5<=mouseY && mouseY<=35) {
    if(saveFile==0) {
      strokeWeight(1);
      saveFile=1;
    }
    else {
      saveFile=0;
    }
  }
  
  //get image
  if(85<=mouseX && mouseX<=115 && 5<=mouseY && mouseY<=35) {
    if(getImage==0) {
      strokeWeight(1);
      getImage=1;
    }
    else {
      getImage=0;
    }
  }
  
  //color pick
  if(140<=mouseX && mouseX<=180 && 5<=mouseY && mouseY<=35) {
    if(colorPick==0) {
      colorPick=1;
    }
    else {
      colorPick=0;
    }
  }
  
  //thickness
  if(405<=mouseX && mouseX<=425 && 10<=mouseY && mouseY<=30) {
    bolding++;
  }
  if(430<=mouseX && mouseX<=450 && 10<=mouseY && mouseY<=30) {
    bolding--;
  }
  
  //brightness
  if(585<=mouseX && mouseX<=605 && 10<=mouseY && mouseY<=30) {
    brighting++;
  }
  if(610<=mouseX && mouseX<=630 && 10<=mouseY && mouseY<=30) {
    brighting--;
  }
  
  //mode
  if(5<=mouseX && mouseX<=35 && 45<=mouseY && mouseY<=75) {
    //pencil
    mode=0;
  }
  if(5<=mouseX && mouseX<=35 && 85<=mouseY && mouseY<=115) {
    //brush
    mode=1;
  }
  if(5<=mouseX && mouseX<=35 && 125<=mouseY && mouseY<=155) {
    //text
    mode=2;
  }
  if(5<=mouseX && mouseX<=35 && 165<=mouseY && mouseY<=195) {
    //figure
    mode=3;
  }
  if(5<=mouseX && mouseX<=35 && 205<=mouseY && mouseY<=235) {
    //eraser
    mode=4;
  }
  
  //layer
  if(800<=mouseX && mouseX<=900 && 700<=mouseY && 750<=mouseY) {
    currentLayer = 1;
  }
  if(800<=mouseX && mouseX<=900 && 750<=mouseY && 800<=mouseY) {
    currentLayer = 2;
  }
}

void mouseClicked() {
  //R
  if(228<mouseX && mouseX<240 && 1<mouseY && mouseY<13) {
    colorR++;
  }
  if(228<mouseX && mouseX<240 && 27<mouseY && mouseY<39) {
    colorR--;
  }
  
  //G
  if(248<mouseX && mouseX<260 && 1<mouseY && mouseY<13) {
    colorG++;
  }
  if(248<mouseX && mouseX<260 && 27<mouseY && mouseY<39) {
    colorG--;
  }
  
  //B
  if(268<mouseX && mouseX<280 && 1<mouseY && mouseY<13) {
    colorB++;
  }
  if(268<mouseX && mouseX<280 && 27<mouseY && mouseY<39) {
    colorB--;
  }
}

void mouseDragged() {
  if (200<=mouseX && mouseX<=700 && 200<mouseY && mouseY<=900) {
    if(mode==1) {
      for(int i=0; i<10; i++) {
        ellipse(mouseX+random(-bolding*5,bolding*5), mouseY+random(-bolding*5,bolding*5),5,5);
      }
    }
    else
      line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void plusButton(int x, int y, int r) {
  fill(255);
  strokeWeight(1);
  circle(x,y,r);
  line(x+r/4, y, x-r/4, y);
  line(x, y+r/4, x, y-r/4);
}

void minusButton(int x, int y, int r) {
  fill(255);
  strokeWeight(1);
  circle(x,y,r);
  line(x+r/4, y, x-r/4, y);
}

void simpleFont() {
  PFont font;
  font = loadFont("regular.vlw");
  textFont(font, 12);
}

public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;
  
  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    
    cpImage = new PImage( w, h );
    
    init();
  }
  
  private void init ()
  {
    // draw color.
    int cw = w - 60;
    for( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;
      
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    
    // draw black/white.
    drawRect( cw, 0,   30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
    
    // draw grey scale.
    for( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );
    }
  }
  
  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  
  public void render ()
  {
    image( cpImage, x, y );
    if( mousePressed &&
  mouseX >= x && 
  mouseX < x + w &&
  mouseY >= y &&
  mouseY < y + h )
    {
      c = get( mouseX, mouseY );
    }
    clr = c;
    fill( c );
    rect( x, y+h+10, 20, 20 );
  }
}
