#include <DHT.h>
#define DHTPIN 52     
#define DHTTYPE DHT11

#include <LiquidCrystal.h>
const int rs = 8, en = 9, d4 = 2, d5 = 3, d6 = 4, d7 = 5;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

DHT dht(DHTPIN, DHTTYPE);

void setup() {

  dht.begin();
  lcd.begin(16, 2);
    lcd.print(" Make Use Of: ");          // Print a message to the LCD.
  lcd.setCursor(0, 1);
  lcd.print("Temp&Humidity");
}

void loop() {
  
  delay(1000);
  float h = dht.readHumidity();     
  float t = dht.readTemperature();      // Read temperature as Celsius (the default)
  float f = dht.readTemperature(true); // Read temperature as Fahrenheit (isFahrenheit = true)

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Temp.: ");
  lcd.print(t);
  lcd.print(" C");

  lcd.setCursor(0, 1);
  lcd.print("Humi.:");
  lcd.print(h);
  lcd.print(" %");
}
