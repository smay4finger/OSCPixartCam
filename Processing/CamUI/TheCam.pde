Serial cam1;
Serial cam2;

public volatile int cam1Blob1X = 0;
public volatile int cam1Blob1Y = 0;
public volatile int cam1Blob1Size = 0;

public volatile int cam1Blob2X = 0;
public volatile int cam1Blob2Y = 0;
public volatile int cam1Blob2Size = 0;

public volatile int cam1Blob3X = 0;
public volatile int cam1Blob3Y = 0;
public volatile int cam1Blob3Size = 0;

public volatile int cam1Blob4X = 0;
public volatile int cam1Blob4Y = 0;
public volatile int cam1Blob4Size = 0;

public volatile int cam1BlobX = 0;
public volatile int cam1BlobY = 0;

public volatile int cam2Blob1X = 0;
public volatile int cam2Blob1Y = 0;
public volatile int cam2Blob1Size = 0;

public volatile int cam2Blob2X = 0;
public volatile int cam2Blob2Y = 0;
public volatile int cam2Blob2Size = 0;

public volatile int cam2Blob3X = 0;
public volatile int cam2Blob3Y = 0;
public volatile int cam2Blob3Size = 0;

public volatile int cam2Blob4X = 0;
public volatile int cam2Blob4Y = 0;
public volatile int cam2Blob4Size = 0;

public volatile int cam2BlobX = 0;
public volatile int cam2BlobY = 0;

public void cam1Connect(String serialPort) {
  if (cam1 != null) {
    cam1Disconnect();
  }
  println("cam1 connect to " + serialPort);
  cam1 = new Serial(this, serialPort, 115200);
  cam1.bufferUntil('\n');
}

public void cam1Disconnect() {
  if (cam1 != null) {
    println("cam1 disconnect");
    cam1.stop();
    cam1 = null;
  }
}

public void cam2Connect(String serialPort) {
  if (cam2 != null) {
    cam2Disconnect();
  }
  println("cam2 connect to " + serialPort);
  cam2 = new Serial(this, serialPort, 115200);
  cam2.bufferUntil('\n');
}

public void cam2Disconnect() {
  if (cam2 != null) {
    println("cam2 disconnect");
    cam2.stop();
    cam2 = null;
  }
}

void serialEvent(Serial p) {
  try {
    JSONObject data = parseJSONObject(p.readString());
    
    if (p == cam1) {
      cam1Blob1X = data.getJSONObject("blob1").getInt("x");
      cam1Blob1Y = data.getJSONObject("blob1").getInt("y");
      cam1Blob1Size = data.getJSONObject("blob1").getInt("s");
      cam1Blob2X = data.getJSONObject("blob2").getInt("x");
      cam1Blob2Y = data.getJSONObject("blob2").getInt("y");
      cam1Blob2Size = data.getJSONObject("blob2").getInt("s");
      cam1Blob3X = data.getJSONObject("blob3").getInt("x");
      cam1Blob3Y = data.getJSONObject("blob3").getInt("y");
      cam1Blob3Size = data.getJSONObject("blob3").getInt("s");
      cam1Blob4X = data.getJSONObject("blob4").getInt("x");
      cam1Blob4Y = data.getJSONObject("blob4").getInt("y");
      cam1Blob4Size = data.getJSONObject("blob4").getInt("s");
      if(cam1Blob1Size < 15 || cam1Blob2Size < 15 || cam1Blob3Size < 15 || cam1Blob4Size < 15) {
        cam1BlobX = 
           ((cam1Blob1Size < 15 ? cam1Blob1X : 0)
          + (cam1Blob2Size < 15 ? cam1Blob2X : 0)
          + (cam1Blob3Size < 15 ? cam1Blob3X : 0)
          + (cam1Blob4Size < 15 ? cam1Blob4X : 0)) 
          /((cam1Blob1Size < 15 ? 1 : 0)
          + (cam1Blob2Size < 15 ? 1 : 0)
          + (cam1Blob3Size < 15 ? 1 : 0)
          + (cam1Blob4Size < 15 ? 1 : 0));
        
        cam1BlobY = 
           ((cam1Blob1Size < 15 ? cam1Blob1Y : 0) 
          + (cam1Blob2Size < 15 ? cam1Blob2Y : 0)
          + (cam1Blob3Size < 15 ? cam1Blob3Y : 0)
          + (cam1Blob4Size < 15 ? cam1Blob4Y : 0))
          /((cam1Blob1Size < 15 ? 1 : 0) 
          + (cam1Blob2Size < 15 ? 1 : 0)
          + (cam1Blob3Size < 15 ? 1 : 0)
          + (cam1Blob4Size < 15 ? 1 : 0));
      } 
    }
    
    if (p == cam2) {
      cam2Blob1X = data.getJSONObject("blob1").getInt("x");
      cam2Blob1Y = data.getJSONObject("blob1").getInt("y");
      cam2Blob1Size = data.getJSONObject("blob1").getInt("s");
      cam2Blob2X = data.getJSONObject("blob2").getInt("x");
      cam2Blob2Y = data.getJSONObject("blob2").getInt("y");
      cam2Blob2Size = data.getJSONObject("blob2").getInt("s");
      cam2Blob3X = data.getJSONObject("blob3").getInt("x");
      cam2Blob3Y = data.getJSONObject("blob3").getInt("y");
      cam2Blob3Size = data.getJSONObject("blob3").getInt("s");
      cam2Blob4X = data.getJSONObject("blob4").getInt("x");
      cam2Blob4Y = data.getJSONObject("blob4").getInt("y");
      cam2Blob4Size = data.getJSONObject("blob4").getInt("s");
      if(cam2Blob1Size < 15 || cam2Blob2Size < 15 || cam2Blob3Size < 15 || cam2Blob4Size < 15) {
        cam2BlobX = 
           ((cam2Blob1Size < 15 ? cam2Blob1X : 0)
          + (cam2Blob2Size < 15 ? cam2Blob2X : 0)
          + (cam2Blob3Size < 15 ? cam2Blob3X : 0)
          + (cam2Blob4Size < 15 ? cam2Blob4X : 0)) 
          /((cam2Blob1Size < 15 ? 1 : 0)
          + (cam2Blob2Size < 15 ? 1 : 0)
          + (cam2Blob3Size < 15 ? 1 : 0)
          + (cam2Blob4Size < 15 ? 1 : 0));
        
        cam2BlobY = 
           ((cam2Blob1Size < 15 ? cam2Blob1Y : 0) 
          + (cam2Blob2Size < 15 ? cam2Blob2Y : 0)
          + (cam2Blob3Size < 15 ? cam2Blob3Y : 0)
          + (cam2Blob4Size < 15 ? cam2Blob4Y : 0))
          /((cam2Blob1Size < 15 ? 1 : 0) 
          + (cam2Blob2Size < 15 ? 1 : 0)
          + (cam2Blob3Size < 15 ? 1 : 0)
          + (cam2Blob4Size < 15 ? 1 : 0));
      } 
    }
    
    
    oscUpdate();
    uiUpdate();
  }
  catch(RuntimeException e) {
    // ignore
    // there is no other chance, as Processing is doint this by design
  }
}