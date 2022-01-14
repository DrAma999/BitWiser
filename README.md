<p align="center">
  <img width="200" height="200" src="README/Icon.png">
</p>

![Swift](https://github.com/DrAma999/LittleBlueTooth/workflows/Swift/badge.svg?branch=master)
[![codecov](https://codecov.io/gh/DrAma999/BitWiser/branch/main/graph/badge.svg?token=Y3TXZ5NQN7)](https://codecov.io/gh/DrAma999/BitWiser)
[![CodeFactor](https://www.codefactor.io/repository/github/drama999/bitwiser/badge/main)](https://www.codefactor.io/repository/github/drama999/bitwiser/overview/main)


# BitWiser

Bitwiser is a collection of methods and properties that makes you work with `bits`, `bytes` and `nibbles` a piece of cake

The project is in early stages of development feel free to make pull requests for more funcionalities

## FEATURES
* No more bit masking. Access single bit values 
* Coverting from bytes array to `Data` and back has never been easier
* Print `Data` into hex string
* Set, reset, query, toggle each bit
* Subscript
* Chaining methods
* Extensive code coverage
* Multiplatform: iOS, macOS, tvOS, watchOS, Linux, Windows

## INSTALLATION
Use Swift package manager.
Add the following dependency to your Package.swift file:
```
.package(url: "https://github.com/DrAma999/BitWiser.git", from: "0.0.2")
```
Or simply add the URL from XCode menu Swift packages.

## HOW TO USE IT
A `Byte` is simply a `UInt8` that has been extended to access single bit values.
A `Bit` is an enumeration that can assume two values `.one` or `.zero`.
```
 var value = Byte(0b1010_1010)
 let bits = value.bits 
 print(bits)
 // [0, 1, 0, 1, 0, 1, 0, 1]
```
**Note:** Bits representation is shown as an array of `Bit` where the array index 0 represents the **least significant bit** 

After creating a `Byte` you can read in its position in different ways:
_Subscript_
```
let bit = value[0]
```
_Method_
```
// Query the value
let bit = value.bit(0)
// Ask if bit is set (equal to one)
let isSet = value.isBitSet(0)
```
_Properties_
```
let bit = value.b0
```
After creating a  mutable `Byte` you can write in its position in different ways:
_Subscript_
```
value[0] = 1
```
_Method_
```
// Set the specified bit to 1
value.setBit(0)
// Reset the specified bit to 0
value.resetBit(0)
// Toggle the specified bit. If the bit in position zero is one it becomes zero and viceversa
value.resetBit(0)
// Change the value of the specified bit to one
value.changeBit(0, to: .one )

// Chaining modifiers that return a new value without mutating
let newValue = value
              .settingBit(0)
              .resettingBit(3)
              .togglingBit(4)

```
_Properties_
```
value.b0 = .zero
```

Pretty sure that if you worked in IOT you had an embedded engineer that put some infomration inside a nibble.
With bit wiser you can extract nibbles from a byte:
```
 let value: Byte = 0b01011111
 let (msb, lsb) = value.nibbles
```

There are also a lot of methods and facilities to work with bit bites and nibbles.

## CONTRIBUTING
Since I'm working on this project in my spare time any help is appreciated.
Feel free to make a pull request.

## THANKS

Icon made by  [Freepik](https://www.flaticon.com/authors/freepik)  from  [www.flaticon.com](http://www.flaticon.com/) 

## LICENSE
MIT License

Copyright (c) 2021 Andrea Finollo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
