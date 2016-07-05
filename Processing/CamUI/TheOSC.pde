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
    oscClient.send("/cam/blob", new Object[] { cam1BlobX, cam1BlobY, cam2BlobX });
  }
}

void oscEvent(OscMessage theMessage) {
  System.out.println("### got a message " + theMessage);
}