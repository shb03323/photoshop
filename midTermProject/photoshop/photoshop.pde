ColorPicker cp;
int colorR = 0;
int colorG = 0;
int colorB = 0;
color clr = color(colorR, colorG, colorB);
int lineSize = 3;
int mode = 0;
int colorPressed = 0;

void setup() {
  size(1500,1000);
  background(70);
  fill(150);
  noStroke();
  rect(0,0,width,40);
  rect(0,0,40,height);
}

void draw() {
  UI();
  println(colorR+","+colorG+","+colorB);
  fill(clr);
  rect(140, 5, 40, 30);
  cp.render();
}

void UI() {
  fill(70);
  rect(0,0,1500,1000);
  
  fill(150);
  noStroke();
  rect(0,0,width,40);
  rect(0,0,40,height);
  
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(200,200,500,700);
  
  cp = new ColorPicker(1000, 200, 400, 400, 255);
  
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
  
  //PFont font;
  //font = loadFont("BMDOHYEON_ttf.ttf");
  //textFont(font, 16);
  
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
  
  String thk;
  thk= "thickness";
  fill(255);
  text(thk, 350, 25);
  rect(300, 5, 40, 30);
  strokeWeight(lineSize);
  line(310, 20, 330, 20);
  
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
  strokeWeight(2);
  
  //eraser
  PImage eraser;
  eraser = loadImage("eraser.png");
  rect(5, 205, 30, 30);
  image(eraser, 5, 205, 30, 30);
  
}



void mouseReleased() {
  
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
    fill( c );
    rect( x, y+h+10, 20, 20 );
  }
}
