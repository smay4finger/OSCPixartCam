import netP5.*;
import oscP5.*;

import processing.serial.*;
import controlP5.*;
import java.util.*;

void setup() {
  size(300, 320, P2D);
  frameRate(30);

  createUI();
}

static float x = 512.0;
static float y = 768.0 / 2.0;

void draw() {
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();

  background(128);

  fill(255,255,255);

  ellipse(
    camBlob4X / 1024.0 * width, 
    camBlob4Y / 768.0 * height, 
    camBlob4Size * 10 + 10,
    camBlob4Size * 10 + 10);

  ellipse(
    camBlob3X / 1024.0 * width, 
    camBlob3Y / 768.0 * height, 
    camBlob3Size * 10 + 10,
    camBlob3Size * 10 + 10);

  ellipse(
    camBlob2X / 1024.0 * width, 
    camBlob2Y / 768.0 * height, 
    camBlob2Size * 10 + 10,
    camBlob2Size * 10 + 10);

  fill(255,0,0);

  ellipse(
    camBlob1X / 1024.0 * width, 
    camBlob1Y / 768.0 * height, 
    camBlob1Size * 10 + 10,
    camBlob1Size * 10 + 10);

  fill(255,255,0);
  
  ellipse(
    camBlobX / 1024.0 * width,
    camBlobY / 768.0 * height,
    20, 20);

  popMatrix();
  hint(DISABLE_DEPTH_TEST);
}