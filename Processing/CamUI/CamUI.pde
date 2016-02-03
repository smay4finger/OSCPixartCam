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

void draw() {
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();

  background(128);

  ellipse(
    camBlob1X / 1024.0 * width, 
    camBlob1Y / 768.0 * height, 
    camBlob1Size * 10 + 10,
    camBlob1Size * 10 + 10);

  ellipse(
    camBlob2X / 1024.0 * width, 
    camBlob2Y / 768.0 * height, 
    camBlob2Size * 10 + 10,
    camBlob2Size * 10 + 10);

  ellipse(
    camBlob3X / 1024.0 * width, 
    camBlob3Y / 768.0 * height, 
    camBlob3Size * 10 + 10,
    camBlob3Size * 10 + 10);

  ellipse(
    camBlob4X / 1024.0 * width, 
    camBlob4Y / 768.0 * height, 
    camBlob4Size * 10 + 10,
    camBlob4Size * 10 + 10);

  popMatrix();
  hint(DISABLE_DEPTH_TEST);
}