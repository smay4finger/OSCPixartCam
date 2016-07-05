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

  if (showRaw) {
    fill(255,0,0);
  
    ellipse(
      cam1Blob4X / 1024.0 * width, 
      cam1Blob4Y / 768.0 * height, 
      cam1Blob4Size * 10 + 10,
      cam1Blob4Size * 10 + 10);
  
    ellipse(
      cam1Blob3X / 1024.0 * width, 
      cam1Blob3Y / 768.0 * height, 
      cam1Blob3Size * 10 + 10,
      cam1Blob3Size * 10 + 10);
  
    ellipse(
      cam1Blob2X / 1024.0 * width, 
      cam1Blob2Y / 768.0 * height, 
      cam1Blob2Size * 10 + 10,
      cam1Blob2Size * 10 + 10);
      
    ellipse(
      cam1Blob1X / 1024.0 * width, 
      cam1Blob1Y / 768.0 * height, 
      cam1Blob1Size * 10 + 10,
      cam1Blob1Size * 10 + 10);
  
    fill(0,0,255);
  
    ellipse(
      cam2Blob4X / 1024.0 * width, 
      cam2Blob4Y / 768.0 * height, 
      cam2Blob4Size * 10 + 10,
      cam2Blob4Size * 10 + 10);
  
    ellipse(
      cam2Blob3X / 1024.0 * width, 
      cam2Blob3Y / 768.0 * height, 
      cam2Blob3Size * 10 + 10,
      cam2Blob3Size * 10 + 10);
  
    ellipse(
      cam2Blob2X / 1024.0 * width, 
      cam2Blob2Y / 768.0 * height, 
      cam2Blob2Size * 10 + 10,
      cam2Blob2Size * 10 + 10);
      
    ellipse(
      cam2Blob1X / 1024.0 * width, 
      cam2Blob1Y / 768.0 * height, 
      cam2Blob1Size * 10 + 10,
      cam2Blob1Size * 10 + 10);
  }
  
  fill(255,255,0);
  ellipse(
    cam1BlobX / 1024.0 * width,
    cam1BlobY / 768.0 * height,
    cam2BlobX / 1024.0 * width, 
    cam2BlobX / 1024.0 * width);

  popMatrix();
  hint(DISABLE_DEPTH_TEST);
}