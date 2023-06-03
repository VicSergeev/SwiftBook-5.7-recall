// June 3 2023

// my notes from Swift language guideline
// Total Recall of what I learned
// Sequence of contents are following book chpaters



// type annotation
var someVar: String = ""
let someLet: Int = 0

//multiline comments
/*
 This is multiline comment
 */

// Swift support (signed)Ints and (unsigned)UInts UInt8,16,32,64,128
// Ints are preferable

/*
 String - are the symbols surrounded with double qoutes
 Char - single character
 Int - integer number
 Double(64bit)/Float(32bit) - floating point numbers, Double is preferable
 Double 15 digits
 Float 6 digits
 */
let plus = 5
var sum = plus + 5
print(sum)

//type casting
let myDouble = 3.5
let myFloat = 3.5

var myFloatingPointNums = Double(myFloat) + myDouble
print(myFloatingPointNums)

// type alias - reference to existing data type
typealias AudioSample = UInt16
let maxAmplitude = AudioSample.min

// Bool type - false/true

// Tuples - group of values of many different types, same types are supported too
let myTuple = (42, "Hello!", true, 3.14)
myTuple.0 // answer to everything access by index

// tuple decomposition
let (answerToEverything, greeting, isTrue, pi) = myTuple // here must be exact number of items that tuple has
print(answerToEverything)
print(pi)
// ignore value
let (answer, greet, _, piNum) = myTuple // all except bool


