#include <DigiKeyboard.h>
#define PIN_LED 1
#define PIN_TOUCH 2

int randomBetween(int min, int max) {
  return rand() % (max - min + 1) + min;
}
void pauseSmall() {
  DigiKeyboard.delay(randomBetween(50, 100));
}
void pauseLong() {
  DigiKeyboard.delay(randomBetween(5000, 10000));
}

// https://www.usb.org/sites/default/files/hut1_5.pdf
// https://www.rapidtables.com/convert/number/hex-to-decimal.html?x=2A
// Traducir de EEUU a ES mirando una foto en google de ambos teclados
void openSquareBracket() {
  DigiKeyboard.sendKeyStroke(47, MOD_ALT_RIGHT);
}
void closeSquareBracket() {
  DigiKeyboard.sendKeyStroke(48, MOD_ALT_RIGHT);
}
void equal() {
  DigiKeyboard.sendKeyStroke(KEY_0, MOD_SHIFT_LEFT);
}
void deletee() {
  DigiKeyboard.sendKeyStroke(42);
}
void deleteForward() {
  DigiKeyboard.sendKeyStroke(76);
}

void setup() {
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_TOUCH, INPUT_PULLUP);

  // Apagar led verde
  pinMode(0, OUTPUT);
  digitalWrite(0, LOW);
}

int isEnabled = 0;

void loop() {
  if (digitalRead(PIN_TOUCH) == LOW){
    isEnabled = 1;
  } else {
    isEnabled = 0;
  }

  if (!isEnabled) {
    digitalWrite(PIN_LED, LOW);
    return;
  }

  digitalWrite(PIN_LED, HIGH);
  pauseLong();

  // this is generally not necessary but with some older systems it seems to
  // prevent missing the first character after a delay:
  DigiKeyboard.sendKeyStroke(0);

  DigiKeyboard.print("const tables ");
  pauseSmall();
  equal();
  pauseSmall();
  DigiKeyboard.print(" ");
  pauseSmall();
  openSquareBracket();
  pauseSmall();
  closeSquareBracket();
  pauseLong();

  for (int i = 0; i < 17; i++) {
    deletee();
    pauseSmall();
  }
}