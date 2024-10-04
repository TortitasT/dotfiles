#include <DigiKeyboard.h>

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

void setup() {}

void loop() {
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