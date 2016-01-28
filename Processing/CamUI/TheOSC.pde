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

void oscUpdate() {
  if (oscClient != null) {
    
    oscClient.send("/cam/blob1", new Object[] { camBlob1X, camBlob1Y, camBlob1Size });
    oscClient.send("/cam/blob2", new Object[] { camBlob2X, camBlob2Y, camBlob2Size });
    oscClient.send("/cam/blob3", new Object[] { camBlob3X, camBlob3Y, camBlob3Size });
    oscClient.send("/cam/blob4", new Object[] { camBlob4X, camBlob4Y, camBlob4Size });
  }
}

void oscEvent(OscMessage theMessage) {
  System.out.println("### got a message " + theMessage);
}