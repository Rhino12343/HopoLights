/**
  * Hopo light sketch
  * Get screen size, calculate rows and columns by dividing width and height by a variable 
  */

class RGBLed {
  int red;
  int green;
  int blue;
  
  RGBLed(int red, int green, int blue) {
    this.red = red % 256;
    this.green = green % 256;
    this.blue = blue % 256;
  }
}

RGBLed[][] ScreenPixels;
int Spacer;
int PixelSize;
int Rows;
int Cols;
int Tick;
int NextTick = 0;

void setup() {
  fullScreen();
  background(0,255);
  
  Spacer = 10;
  PixelSize = 50;
  Tick = 10;
  
  Cols = displayHeight / (PixelSize + Spacer);
  Rows = displayWidth / (PixelSize + Spacer);
  ScreenPixels = new RGBLed[Rows][Cols];
  
  SetRandom();
}

void draw() {
  while (NextTick < millis()) {
    for (int y = 1; y < Cols; y++){
      for (int x = 1; x < Rows; x++){
        ScreenPixels[x][y] = new RGBLed(ScreenPixels[x][y].red + int(random(1, 2)), ScreenPixels[x][y].green + int(random(1, 2)), ScreenPixels[x][y].blue + int(random(1, 2)));
        noStroke();
        fill(color(ScreenPixels[x][y].red, ScreenPixels[x][y].green, ScreenPixels[x][y].blue));
        circle(x * (PixelSize + Spacer), y * (PixelSize + Spacer), PixelSize);
      }
    }
    
    NextTick = millis() + Tick;
  }
}

void SetWhite() {
    for (int y = 1; y < Cols; y++){
      for (int x = 1; x < Rows; x++){
        ScreenPixels[x][y] = new RGBLed(0,0,0);
      }
    }
}

void SetRandom() {
    for (int y = 1; y < Cols; y++){
      for (int x = 1; x < Rows; x++){
        ScreenPixels[x][y] = new RGBLed(int(random(255)),int(random(255)),int(random(255)));
      }
    }
}
