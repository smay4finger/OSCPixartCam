ControlP5 cp5;

Textfield uiHostnameOSC;
Numberbox uiPortOSC;
Button uiConnectOSC;
ScrollableList uiSelectedSerialPort1;
Button uiConnectSerialPort1;
ScrollableList uiSelectedSerialPort2;
Button uiConnectSerialPort2;

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

Slider uiBlob5X;
Slider uiBlob5Y;
Slider uiBlob5Size;

Slider uiBlob6X;
Slider uiBlob6Y;
Slider uiBlob6Size;

Slider uiBlob7X;
Slider uiBlob7Y;
Slider uiBlob7Size;

Slider uiBlob8X;
Slider uiBlob8Y;
Slider uiBlob8Size;

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
  cp5.addTab("raw cam1");

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
  uiSelectedSerialPort1 = cp5.addScrollableList("uiSelectedSerialPort1")
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
  uiConnectSerialPort1 = cp5.addButton("uiConnectSerialPort1")
    .setPosition(160, 50)
    .setSize(70, 20)
    .setLabel("connect cam1")
    .setSwitch(true)
    ;
  uiSelectedSerialPort2 = cp5.addScrollableList("uiSelectedSerialPort2")
    .addItems(Arrays.asList(Serial.list()))
    .setPosition(5, 75)
    .setSize(150, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .onEnter(toFront)
    .onLeave(close)
    .setLabel("")
    .setValue(0)
    .close()
    ;
  uiConnectSerialPort2 = cp5.addButton("uiConnectSerialPort2")
    .setPosition(160, 75)
    .setSize(70, 20)
    .setLabel("connect cam2")
    .setSwitch(true)
    ;
    
  cp5.addFrameRate()
    .setInterval(10)
    .setPosition(5, height-15)
    .setSize(40, 20)
    .moveTo("global")
    ;

  cp5.addLabel("Blob1")
    .setPosition(5, 25)
    .setFont(createFont("", 15))
    .moveTo("raw cam1");
  uiBlob1X = cp5.addSlider("X (blob1)")
    .setPosition(5, 47)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob1Y = cp5.addSlider("Y (blob1)")
    .setPosition(5, 62)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob1Size = cp5.addSlider("size (blob1)")
    .setPosition(5, 77)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam1");

  cp5.addLabel("Blob2")
    .setPosition(5, 94)
    .setFont(createFont("", 15))
    .moveTo("raw cam1");
  uiBlob2X = cp5.addSlider("X (blob2)")
    .setPosition(5, 116)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob2Y = cp5.addSlider("Y (blob2)")
    .setPosition(5, 131)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob2Size = cp5.addSlider("size (blob2)")
    .setPosition(5, 146)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam1");

  cp5.addLabel("Blob3")
    .setPosition(5, 163)
    .setFont(createFont("", 15))
    .moveTo("raw cam1");
  uiBlob3X = cp5.addSlider("X (blob3)")
    .setPosition(5, 185)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob3Y = cp5.addSlider("Y (blob3)")
    .setPosition(5, 200)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob3Size = cp5.addSlider("size (blob3)")
    .setPosition(5, 215)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam1");

  cp5.addLabel("Blob4")
    .setPosition(5, 232)
    .setFont(createFont("", 15))
    .moveTo("raw cam1");
  uiBlob4X = cp5.addSlider("X (blob4)")
    .setPosition(5, 254)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob4Y = cp5.addSlider("Y (blob4)")
    .setPosition(5, 269)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam1");
  uiBlob4Size = cp5.addSlider("size (blob4)")
    .setPosition(5, 284)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam1");

  cp5.addLabel("Blob5")
    .setPosition(5, 25)
    .setFont(createFont("", 15))
    .moveTo("raw cam2");
  uiBlob5X = cp5.addSlider("X (blob5)")
    .setPosition(5, 47)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob5Y = cp5.addSlider("Y (blob5)")
    .setPosition(5, 62)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob5Size = cp5.addSlider("size (blob5)")
    .setPosition(5, 77)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam2");

  cp5.addLabel("Blob6")
    .setPosition(5, 94)
    .setFont(createFont("", 15))
    .moveTo("raw cam2");
  uiBlob6X = cp5.addSlider("X (blob6)")
    .setPosition(5, 116)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob6Y = cp5.addSlider("Y (blob6)")
    .setPosition(5, 131)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob6Size = cp5.addSlider("size (blob6)")
    .setPosition(5, 146)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam2");

  cp5.addLabel("Blob7")
    .setPosition(5, 163)
    .setFont(createFont("", 15))
    .moveTo("raw cam2");
  uiBlob7X = cp5.addSlider("X (blob7)")
    .setPosition(5, 185)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob7Y = cp5.addSlider("Y (blob7)")
    .setPosition(5, 200)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob7Size = cp5.addSlider("size (blob7)")
    .setPosition(5, 215)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam2");

  cp5.addLabel("Blob8")
    .setPosition(5, 232)
    .setFont(createFont("", 15))
    .moveTo("raw cam2");
  uiBlob8X = cp5.addSlider("X (blob8)")
    .setPosition(5, 254)
    .setSize(150, 12)
    .setRange(0, 1024)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob8Y = cp5.addSlider("Y (blob8)")
    .setPosition(5, 269)
    .setSize(150, 12)
    .setRange(0, 768)
    .setLock(true)
    .moveTo("raw cam2");
  uiBlob8Size = cp5.addSlider("size (blob8)")
    .setPosition(5, 284)
    .setSize(150, 12)
    .setRange(0, 15)
    .setLock(true)
    .moveTo("raw cam2");
}

void uiUpdate() {
  uiBlob1X.setValue(cam1Blob1X);
  uiBlob1Y.setValue(cam1Blob1Y);
  uiBlob1Size.setValue(cam1Blob1Size);
  uiBlob2X.setValue(cam1Blob2X);
  uiBlob2Y.setValue(cam1Blob2Y);
  uiBlob2Size.setValue(cam1Blob2Size);
  uiBlob3X.setValue(cam1Blob3X);
  uiBlob3Y.setValue(cam1Blob3Y);
  uiBlob3Size.setValue(cam1Blob3Size);
  uiBlob4X.setValue(cam1Blob4X);
  uiBlob4Y.setValue(cam1Blob4Y);
  uiBlob4Size.setValue(cam1Blob4Size);
  uiBlob5X.setValue(cam2Blob1X);
  uiBlob5Y.setValue(cam2Blob1Y);
  uiBlob5Size.setValue(cam2Blob1Size);
  uiBlob6X.setValue(cam2Blob2X);
  uiBlob6Y.setValue(cam2Blob2Y);
  uiBlob6Size.setValue(cam2Blob2Size);
  uiBlob7X.setValue(cam2Blob3X);
  uiBlob7Y.setValue(cam2Blob3Y);
  uiBlob7Size.setValue(cam2Blob3Size);
  uiBlob8X.setValue(cam2Blob4X);
  uiBlob8Y.setValue(cam2Blob4Y);
  uiBlob8Size.setValue(cam2Blob4Size);
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

  if (theEvent.isFrom(uiConnectSerialPort1)) {
    if (uiConnectSerialPort1.isOn()) {
      uiSelectedSerialPort1.setLock(true);
      uiSelectedSerialPort1.setOpen(false);
      cam1Connect(uiSelectedSerialPort1.getLabel());
    } else {
      uiSelectedSerialPort1.setLock(false);
      cam1Disconnect();
    }
  }
  
  if (theEvent.isFrom(uiConnectSerialPort2)) {
    if (uiConnectSerialPort2.isOn()) {
      uiSelectedSerialPort2.setLock(true);
      uiSelectedSerialPort2.setOpen(false);
      cam2Connect(uiSelectedSerialPort2.getLabel());
    } else {
      uiSelectedSerialPort2.setLock(false);
      cam2Disconnect();
    }
  }
  
  if (theEvent.isFrom(uiSelectedSerialPort1)) {
    println("selected first serial port " + theEvent);
    println("    " + uiSelectedSerialPort1.getLabel());
  }
  
  if (theEvent.isFrom(uiSelectedSerialPort2)) {
    println("selected second serial port " + theEvent);
    println("    " + uiSelectedSerialPort2.getLabel());
  }
}