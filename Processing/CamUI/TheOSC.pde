OscP5 oscClient;

void oscConnect(String hostname, int port) {
  if (oscClient != null) {
    oscDisconnect();
  }
  println("OSC connect to " + hostname + ":" + port);

  OscProperties properties = new OscProperties();
  properties.setRemoteAddress(hostname, port);
  properties.setListeningPort(port);
  properties.setSRSP(OscProperties.ON);
  properties.setDatagramSize(1024);
  oscClient = new OscP5(this, properties);
}

void oscDisconnect() {
  if (oscClient != null) {
    println("OSC disconnect");
    oscClient.stop();
    oscClient = null;
  }
}

static int oldX;
static int oldY;
static int oldZ;

void oscUpdate() {
  if (oscClient != null) {
    if (cam1BlobX > (oldX+uiDiff.getValue())
        || cam1BlobX < (oldX-uiDiff.getValue())
        || cam1BlobY > (oldY+uiDiff.getValue())
        || cam1BlobY < (oldY-uiDiff.getValue())
        || cam2BlobX > (oldZ+uiDiff.getValue())
        || cam2BlobX < (oldZ-uiDiff.getValue()))
      oscClient.send("/cam/blob", new Object[] { cam1BlobX, cam1BlobY, cam2BlobX });
      oldX = cam1BlobX;
      oldY = cam1BlobY;
      oldZ = cam2BlobX;
  }
}

void oscEvent(OscMessage theMessage) {
  System.out.println("### got a message " + theMessage);
}