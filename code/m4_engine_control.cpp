#include <Servo.h>

Servo esc1;
Servo esc2;
Servo esc3;
Servo esc4;

int esc1Pin = 3;
int esc2Pin = 5;
int esc3Pin = 6;
int esc4Pin = 9;

void setup() {
  Serial.begin(9600); // Инициализация последовательного порта для связи с компьютером
  esc1.attach(esc1Pin);
  esc2.attach(esc2Pin);
  esc3.attach(esc3Pin);
  esc4.attach(esc4Pin);

  esc1.writeMicroseconds(1000);
  esc2.writeMicroseconds(1000);
  esc3.writeMicroseconds(1000);
  esc4.writeMicroseconds(1000);

  delay(2000); // Инициализация ESC
}

void loop() {
  if (Serial.available() > 0) {
    // Читаем данные из последовательного порта
    int power = Serial.parseInt(); // Ожидаем получения мощности в микросекундах
    if (power >= 1000 && power <= 2000) {
      esc1.writeMicroseconds(power);
      esc2.writeMicroseconds(power);
      esc3.writeMicroseconds(power);
      esc4.writeMicroseconds(power);
    }
  }
}

