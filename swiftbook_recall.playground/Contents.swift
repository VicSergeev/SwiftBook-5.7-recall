// June 3 2023

import Foundation

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

// June 4 2023
// Optionals

// used for absence of value
// opt might be unwrapped

var someOpt: String? // Optional, default value is nil
// better to use with vars instead of lets
var optWDefaultVal: Int? = 42

// safe unwrapping with if statement
// to unwrap value for optional its value compares with nil, == or != to nil

if someOpt == nil {
    print("there is no value")
}
if optWDefaultVal != nil {
    print("there is a value")
}
// force unwrapping - IF ONLY YOU PRETTY SURE THAT THERE IS A VALUE WHAT YOU CAN EXTRACT, or runtime error
// force unwrapping using exclamation point (!)
let optStr = "123"
let unwrapFromStr = Int(optStr)!

// optional binding
// checks if variable contains value within
// and if it does - make this value available as a temporary variable(let/var)
// in opt binding might be used if as well as while statement to check if there is a value and extract it if needed
// extracts into var or let

// opt bind w/if
if let tempLet = someOpt {
    print("There is a value")
} else {
    print("there is no value")
}
if var tempVar = optWDefaultVal {
    print("there is a value \(tempVar) in optional variable")
} else {
    print("there is no value")
}
// in if statement of opt bind you may use as many bool and opts as possible, until it turn to pyramid of doom
// but if there is false or nil - the whole contruction become false/nil
let optOne: Int? = 15
let optTwo: Int? = 27
let optThree: Int? = 33
let optFour: Int? = 48
if let firstBind = optOne {
    if let secondBind = optTwo {
        if let thirdBind = optThree {
            if let fourthBind = optFour {
                if firstBind < secondBind || fourthBind > thirdBind {
                    if secondBind < thirdBind && firstBind < fourthBind {
                        print("there is a message from pyramid of doom because all conditions are true or there is no nil")
                    }
                }
            }
        }
    }
}

// all lets and vars from opt bind are visible only within if let scope

// vars ans lets created in guard statement visible in scope of following code(aka early exit)

// Implicitly unwrapped opt
let implicitlyOpt: String! = "some value"
let passedInItOpt = implicitlyOpt
// if such value cannot be used as opt swift will perform a forced unwrapping
// if implicitly = nil it will be a runtime error
if implicitlyOpt != nil {
    print(implicitlyOpt!)
} else {
    print("oops")
}
if let checkImplicitly = implicitlyOpt {
    print("there is a value \(checkImplicitly) in optional")
} else {
    print("there is no value")
}

// error handling
// there is a mechanism allows you to work with possible errors in your code
func division(a: Int, b: Int) throws -> Int { // throws = return
    // let's check condition with guard
    guard b != 0 else { throw NSError(domain: "custom description - cause of error: can't divide by zero, code", code: 0) }
    return a / b
}

// func caller do/try/catch
do {
    try division(a: 3, b: 1)
} catch {
    print(error.localizedDescription)
}

// error handling as optional value
let result = try? division(a: 3, b: 0)
if result != nil {
    print(result)
} else {
    print("there is an error accured")
}
// app won't crash

// you can use try! to force unwrapping BUT ONLY IF YOU SURE THERE IS A VALUE, or as usualy - runtime error
let result2 = try! division(a: 3, b: 1)
print(result2)

// basic operators
// addition +, subtraction -, multiplication *, division /
// unary operates only with one target
// prefix !=, !true, !b, -5
var minusSix = -6
var plusToMinus = +minusSix // won't affect -6
print(plusToMinus)
var resultPositive = minusSix + 9
var resultNegative = minusSix - 9
print(resultPositive)
print(resultNegative)

// postfix implicitly!

// binary operates between two operands
let binaryOperator = 3 * 2

// ternary operator, as well as in Clang - there is only one
// a ? b : c
let someValue = true
let answ1 = "this is true value"
let answ2 = "this is false value"
if someValue{
    print(answ1)
} else {
    print(answ2)
}
let header = 40
let hasHeader = true
var rowHeight = header + (hasHeader ? 50 : 20) // inline ternary
// the same
if hasHeader {
    rowHeight = header + 50
} else {
    rowHeight = header + 20
}


// remainder operator
let aR = 9
let bR = 4
var reminder = aR % bR
print(reminder) // 1
// 9 = (4 * 4) + 1

// compaund operators += -= *= /=
var someInt = 9
someInt += 21
print(someInt)

// comparison operators
// == equal to
// != not equal to
// > greater than
// < less than
// >= greater than or equal to
// <= less than or equal to

// nil coalessing
// unwraps opt if it has a value, if it doesn't - return default value

let defaultColor = ".red"
var userColor: String?
var colorToUse = userColor ?? defaultColor


