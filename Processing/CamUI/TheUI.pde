ControlP5 cp5;

Textfield uiHostnameOSC;
Numberbox uiPortOSC;
Button uiConnectOSC;
ScrollableList uiSelectedSerialPort;
public ScrollableList uiCamNumber;
Button uiConnectSerialPort;

Slider uiBlob1X;
Slider uiBlob1Y;
Slider uiBlob1Size;

Slider uiBlob2X;
Slider uiBlob2Y;
Slider uiBlob2Size;

Slider uiBlob3X;
Slider uiBlob3Y;
Slider uiBlob3Size;

Slider uiBlob4X;
Slider uiBlob4Y;
Slider uiBlob4Size;


public void createUI() {

  cp5 = new ControlP5(this);

  CallbackListener toFront = new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      theEvent.getController().bringToFront();
      ((ScrollableList)theEvent.getController()).open();
    }
  };

  CallbackListener close = new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      ((ScrollableList)theEvent.getController()).close();
    }
  };

  cp5.addTab("default");
  cp5.addTab("cam settings");
  cp5.addTab("raw");

  uiHostnameOSC = cp5.addTextfield("uiHostnameOSC")
    .setPosition(5, 25)
    .setSize(100, 20)
    .setLabel("")
    .setValue("127.0.0.1")
    ;
  uiPortOSC = cp5.addNumberbox("uiPortOSC")
    .setPosition(110, 25)
    .setSize(45, 20)
    .setLabel("")
    .setValue(8000)
    .setRange(1, 65535)
    .setDecimalPrecision(0)
    .setScrollSensitivity(1.0)
    ;
  uiConnectOSC = cp5.addButton("uiConnectOSC")
    .setPosition(160, 25)
    .setSize(50, 20)
    .setLabel("connect")
    .setSwitch(true)
    ;
  uiSelectedSerialPort = cp5.addScrollableList("uiSelectedSerialPort")
    .addItems(Arrays.asList(Serial.list()))
    .setPosition(5, 50)
    .setSize(150, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .onEnter(toFront)
    .onLeave(close)
    .setLabel("")
    .setValue(0)
    .close()
    ;
  uiConnectSerialPort = cp5.addButton("uiConnectSerialPort")
    .setPosition(160, 50)
    .setSize(50, 20)
    .setLabel("connect")
    .setSwitch(true)
    ;
  
  uiCamNumber = cp5.addScrollableList("Cam number")
    .addItems(Arrays.asList("1", "2", "3"))
    .setPosition(5, 75)
    .setSize(120, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .onEnter(toFront)
    .onLeave(close)
    .setValue(0)
    .close();

  cp5.addFrameRate()
    .setInterval(10)
    .setPosition(5, height-15)
    .setSize(40, 20)
    .moveTo("global")
    ;

  cp5.addLabel("Blob1")
    .setPosition(5, 25)
    .setFont(createFont("", 15))
    .moveTo("raw");
  uiBlob1X = cp5.addSlider("X (blob1)")
    .setPosition(5, 47)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw");
  uiBlob1Y = cp5.addSlider("Y (blob1)")
    .setPosition(5, 62)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw");
  uiBlob1Size = cp5.addSlider("size (blob1)")
    .setPosition(5, 77)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw");

  cp5.addLabel("Blob2")
    .setPosition(5, 94)
    .setFont(createFont("", 15))
    .moveTo("raw");
  uiBlob2X = cp5.addSlider("X (blob2)")
    .setPosition(5, 116)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw");
  uiBlob2Y = cp5.addSlider("Y (blob2)")
    .setPosition(5, 131)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw");
  uiBlob2Size = cp5.addSlider("size (blob2)")
    .setPosition(5, 146)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw");

  cp5.addLabel("Blob3")
    .setPosition(5, 163)
    .setFont(createFont("", 15))
    .moveTo("raw");
  uiBlob3X = cp5.addSlider("X (blob3)")
    .setPosition(5, 185)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw");
  uiBlob3Y = cp5.addSlider("Y (blob3)")
    .setPosition(5, 200)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw");
  uiBlob3Size = cp5.addSlider("size (blob3)")
    .setPosition(5, 215)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw");

  cp5.addLabel("Blob4")
    .setPosition(5, 232)
    .setFont(createFont("", 15))
    .moveTo("raw");
  uiBlob4X = cp5.addSlider("X (blob4)")
    .setPosition(5, 254)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw");
  uiBlob4Y = cp5.addSlider("Y (blob4)")
    .setPosition(5, 269)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw");
  uiBlob4Size = cp5.addSlider("size (blob4)")
    .setPosition(5, 284)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw");
}

void uiUpdate() {
  uiBlob1X.setValue(camBlob1X);
  uiBlob1Y.setValue(camBlob1Y);
  uiBlob1Size.setValue(camBlob1Size);
  uiBlob2X.setValue(camBlob2X);
  uiBlob2Y.setValue(camBlob2Y);
  uiBlob2Size.setValue(camBlob2Size);
  uiBlob3X.setValue(camBlob3X);
  uiBlob3Y.setValue(camBlob3Y);
  uiBlob3Size.setValue(camBlob3Size);
  uiBlob4X.setValue(camBlob4X);
  uiBlob4Y.setValue(camBlob4Y);
  uiBlob4Size.setValue(camBlob4Size);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(uiConnectOSC)) {
    if (uiConnectOSC.isOn()) {
      uiHostnameOSC.setLock(true);
      uiPortOSC.setLock(true);
      oscConnect(uiHostnameOSC.getText(), (int)uiPortOSC.getValue());
    } else {
      uiHostnameOSC.setLock(false);
      uiPortOSC.setLock(false);
      oscDisconnect();
    }
  }

  if (theEvent.isFrom(uiConnectSerialPort)) {
    if (uiConnectSerialPort.isOn()) {
      uiSelectedSerialPort.setLock(true);
      uiSelectedSerialPort.setOpen(false);
      camConnect(uiSelectedSerialPort.getLabel());
    } else {
      uiSelectedSerialPort.setLock(false);
      camDisconnect();
    }
  }

  if (theEvent.isFrom(uiSelectedSerialPort)) {
    println("selected serial port " + theEvent);
    println("    " + uiSelectedSerialPort.getValue());
  }
}