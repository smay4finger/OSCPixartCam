Serial cam;

public volatile int camBlob1X = 0;
public volatile int camBlob1Y = 0;
public volatile int camBlob1Size = 0;

public volatile int camBlob2X = 0;
public volatile int camBlob2Y = 0;
public volatile int camBlob2Size = 0;

public volatile int camBlob3X = 0;
public volatile int camBlob3Y = 0;
public volatile int camBlob3Size = 0;

public volatile int camBlob4X = 0;
public volatile int camBlob4Y = 0;
public volatile int camBlob4Size = 0;

public volatile int camBlobX = 0;
public volatile int camBlobY = 0;

public void camConnect(String serialPort) {
  if (cam != null) {
    camDisconnect();
  }
  println("cam connect to " + serialPort);
  cam = new Serial(this, serialPort, 115200);
  cam.bufferUntil('\n');
}

public void camDisconnect() {
  if (cam != null) {
    println("cam disconnect");
    cam.stop();
    cam = null;
  }
}

void serialEvent(Serial p) {
  String inString = p.readString();
  try {
    JSONObject data = parseJSONObject(inString);
    camBlob1X = data.getJSONObject("blob1").getInt("x");
    camBlob1Y = data.getJSONObject("blob1").getInt("y");
    camBlob1Size = data.getJSONObject("blob1").getInt("s");
    camBlob2X = data.getJSONObject("blob2").getInt("x");
    camBlob2Y = data.getJSONObject("blob2").getInt("y");
    camBlob2Size = data.getJSONObject("blob2").getInt("s");
    camBlob3X = data.getJSONObject("blob3").getInt("x");
    camBlob3Y = data.getJSONObject("blob3").getInt("y");
    camBlob3Size = data.getJSONObject("blob3").getInt("s");
    camBlob4X = data.getJSONObject("blob4").getInt("x");
    camBlob4Y = data.getJSONObject("blob4").getInt("y");
    camBlob4Size = data.getJSONObject("blob4").getInt("s");
    
    if(camBlob1Size < 15 || camBlob2Size < 15 || camBlob3Size < 15 || camBlob4Size < 15) {
      int validValues =

      camBlobX = 
         ((camBlob1Size < 15 ? camBlob1X : 0)
        + (camBlob2Size < 15 ? camBlob2X : 0)
        + (camBlob3Size < 15 ? camBlob3X : 0)
        + (camBlob4Size < 15 ? camBlob4X : 0)) 
        /((camBlob1Size < 15 ? 1 : 0)
        + (camBlob2Size < 15 ? 1 : 0)
        + (camBlob3Size < 15 ? 1 : 0)
        + (camBlob4Size < 15 ? 1 : 0));
      
      camBlobY = 
         ((camBlob1Size < 15 ? camBlob1Y : 0) 
        + (camBlob2Size < 15 ? camBlob2Y : 0)
        + (camBlob3Size < 15 ? camBlob3Y : 0)
        + (camBlob4Size < 15 ? camBlob4Y : 0))
        /((camBlob1Size < 15 ? 1 : 0) 
        + (camBlob2Size < 15 ? 1 : 0)
        + (camBlob3Size < 15 ? 1 : 0)
        + (camBlob4Size < 15 ? 1 : 0));
    } 
    
    oscUpdate();
    uiUpdate();
  }
  catch(RuntimeException e) {
    // ignore
    // there is no other chance, as Processing is doint this by design
  }
}