ColorPicker cp;
int colorR = 0;
int colorG = 0;
int colorB = 0;
color clr = color(colorR, colorG, colorB);
int bolding = 3;
int mode = 0;
int saveFile = 0;
int colorPick = 0;
int mySwitch = 0;
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
  
  //font
  PFont font;
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font, 12);
  
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
}

void draw() {
  
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
    text(OK, 782, 565);
    
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
  
  //color button
  if(colorPick==1) {
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
  
  //eraser
  if(mode==4) {
    strokeWeight(20);
    stroke(255);
  }
}

void keyPressed() {
  if (saveFile==1 && mySwitch==0) {
    if (key == BACKSPACE) {
      str = "";
      return;
    }
    str += key;
    text(str, 800, 500);
  }
}

void mouseReleased() {
  //save
  if(5<=mouseX && mouseX<=30 && 5<=mouseY && mouseY<=30) {
    if(saveFile==0) {
      saveFile=1;
    }
    else {
      saveFile=0;
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
  
  //mode
  if(5<=mouseX && mouseX<=35 && 45<=mouseX && mouseX<=75) {
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
