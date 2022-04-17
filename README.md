Write a program which converts strings written in English into Morse code using the C language.

Morse Code [Wikipedia]:
Morse code is a method used in telecommunication to encode text characters as standardized sequences of two different signal durations, called dots and dashes, or dits and dahs.
Each of the 26 English characters (a-z) and numbers (0-9) are represented as a small set of dits and dahs.
Below is a table mapping each character to its Morse Code version Code Functionality:
• The program should ask the user for a string input
• After receiving the string, the program should print to the screen using morse code symbols:
• Dot: should be the period ‘.’ character
• Dah: should be the underscore ‘_‘ character
• Space between symbols should be a single space ‘ ‘
• Space between letters should be three spaces ‘ ‘
• Space between words should be seven spaces ‘ ‘
• After printing the string, the program should ask the user for the next string
Example conversion:
“Hello world” . . . . . . _ . . . _ . . _ _ _ . _ _ _ _ _ . _ . . _ . . _ . .
Bonus : Have the computer also play the morse code as a sound (a series of beeps with the same tone but different durations).
Dits are played for one time unit. Dahs are played for three time units. Each space is silence for one time unit.
