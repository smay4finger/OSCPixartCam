#include <i2c_t3.h>

void cam_send(uint8_t byte1, uint8_t byte2) {
  Wire.beginTransmission(0x58);
  Wire.send(byte1);
  Wire.send(byte2);
  Wire.endTransmission();
}

void setup() {
  Wire.begin(I2C_MASTER, 0, I2C_PINS_18_19, I2C_PULLUP_INT, I2C_RATE_2000);

setup_again:
  delay(1000);

  Wire.beginTransmission(0x58);
  Wire.send(0x30); // control
  Wire.send(0x01);
  if (Wire.endTransmission() != 0) {
    goto setup_again;
  }

  Wire.beginTransmission(0x58);
  Wire.send(0x00); // sensitivity block 1
  Wire.send(0x00);
  Wire.send(0x00);
  Wire.send(0x00);
  Wire.send(0x00);
  Wire.send(0x00);
  Wire.send(0x00);
  Wire.send(0x90);
  Wire.send(0x00);
  Wire.send(0x41);
  if (Wire.endTransmission() != 0) {
    goto setup_again;
  }
  delay(100);

  Wire.beginTransmission(0x58);
  Wire.send(0x1A); // sensititity block 2
  Wire.send(0x40);
  Wire.send(0x00);
  if (Wire.endTransmission() != 0) {
    goto setup_again;
  }
  delay(100);

  Wire.beginTransmission(0x58);
  Wire.send(0x30); // control
  Wire.send(0x08);
  if (Wire.endTransmission() != 0) {
    goto setup_again;
  }
  delay(100);

  Wire.beginTransmission(0x58);
  Wire.send(0x33); // mode
  Wire.send(0x03);
  if (Wire.endTransmission() != 0) {
    goto setup_again;
  }
  delay(100);

  Serial.begin(9600);
  while (!Serial);
}

void loop() {
  // change data rate here!!!
  delay(10);

  Wire.beginTransmission(0x58);
  Wire.send(0x36);
  Wire.endTransmission();

  Wire.requestFrom(0x58, 16);
  uint8_t data[16];
  for ( int i = 0; Wire.available() && i < 16; i++) {
    data[i] = Wire.read();
  }

  Serial.printf("{"
                "\"blob1\":{\"x\":%d,\"y\":%d,\"s\":%d},"
                "\"blob2\":{\"x\":%d,\"y\":%d,\"s\":%d},"
                "\"blob3\":{\"x\":%d,\"y\":%d,\"s\":%d},"
                "\"blob4\":{\"x\":%d,\"y\":%d,\"s\":%d}"
                "}\n",
                /* blob1 */
                data[1] + (data[3] << 4 & 0x300),
                data[2] + (data[3] << 2 & 0x300),
                data[3] & 0x0F,
                /* blob2 */
                data[4] + (data[6] << 4 & 0x300),
                data[5] + (data[6] << 2 & 0x300),
                data[6] & 0x0F,
                /* blob3 */
                data[7] + (data[9] << 4 & 0x300),
                data[8] + (data[9] << 2 & 0x300),
                data[9] & 0x0F,
                /* blob4 */
                data[10] + (data[12] << 4 & 0x300),
                data[11] + (data[12] << 2 & 0x300),
                data[12] & 0x0F
               );
}
