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

// range operators
// closed range operator
// a...b from a to b including b, iterable, e.g. for in loop
for i in 1...5 {
    print("\(i) times five is \(i*5)")
}

// half-opened range
// a..<b from a to b not including b
for i in 1..<8 {
    print("\(i) times 4 is \(i*4)")
}

// one-sided range
// a... continuing as far as possible in one direction (+/-)
let rangeArr = [1,2,3,4,5,6,7]
for i in rangeArr[3...] {
    print(i) // 4,5,6,7
}

// impossible to iterate thru range without initial item, because compiler can't understand where to beign
let unknownBeginning = ...5 // upperBound
unknownBeginning.contains(-8) // true
unknownBeginning.contains(7) // false
unknownBeginning.contains(2) // true

// Logical operators
// && logical AND - true only if both condition are true
// || logical OR - true if either one of condition is true
// !a - local NOT - toggle condition !false = true
if 3 > 2 && 5 < 7 {
    if 2 > 3 || 9 > 4 {
        print("some result")
    }
}
// sequences
if (1 < 2 || 4 > 5) && (2 != 3 && 6 < 9) {
    print("some result")
}


// types of value

// String to create use String literals - sequence of characters(char) surrounded by double quotes "String"
let literallyString: String = "This is String literals"
// multiline strings
let multiline = """
    first four spaces are multiline string scope
    they are must be empty
    and each new line must be started after four whitespaces
    String - value type
    you can loop thru strings
"""
print(multiline)

// looping
var loopThru = "loop"
for char in loopThru {
    print(char)
    // l
    // o
    // o
    // p
}
// string concatination
var concatination = literallyString + multiline + " Hello, World!"
let exclamation: Character = "!"
print(concatination)

print(loopThru)
// accessing char in string by index
let charFromString = loopThru[loopThru.index(loopThru.startIndex, offsetBy: 2)] // accessing index 2
// direct access
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
let directChar = loopThru[3]

// insert & remove
loopThru.append(exclamation)
loopThru.removeLast()
var hello = "hello"
hello.insert(contentsOf: ", world", at: hello.endIndex) // hello, world
hello.remove(at: hello.index(hello.startIndex, offsetBy: 5))
// remove at index-start from index 5 in hello string variable

// Collections
// array, set, dictionary
// arrays - ordered list of contents of the same type
let immutableArray: Array<Int> = [1,2,3,4]
var mutableArray: [Int] = [4,5,6,7]
let shortHandArray = [8,9,10,11] // preferable
let twinsDoubles = Array(repeating: 3.14, count: 5) // (repeating: what, count: how many items)
print(twinsDoubles)
// array concatenation, ONLY THE SAME TYPE
var twoArrays = immutableArray + mutableArray
print(twoArrays)
// accessing & modifying
twoArrays.count
twoArrays.append(8)
twoArrays.isEmpty // false
twoArrays.remove(at: 3)
twoArrays.removeLast()
twoArrays.removeFirst()
// direct addition
twoArrays.insert(34, at: 0) // add 34 at index 0
// loop thru
for i in twoArrays {
    print(i)
}

// show index/value
for (index, value) in twoArrays.enumerated() { // must use enumerated method
    print("the \(value) in twoArrays Array has index \(index)")
}
print(twoArrays.sorted())

//set[] - stores unordered list of elements of the same type, the same elements will be ignored
let ignoredItems: Set<Int> = [1,1,2,2,2,3,4,4,4,5,6,] // 1,2,3,4,5,6
print(ignoredItems.sorted())
// same mothods can be used
var someSet: Set<Int> = [1,2,3,4,5]
someSet.count
someSet.isEmpty
someSet.contains(4) // true
someSet.insert(45)
someSet.contains(4) // true
// looping
for i in someSet {
    print(i)
}

// operations with set

// intersection - method create new set with elements common for both sets
let setOne: Set<Int> = [1,2,3,4,5]
let setTwo: Set<Int> = [1,2,3,4,6]
let setThree: Set<Int> = [1,2,3,4]
let setFour: Set<Int> = [7,8,9]
let intersectionSet = setOne.intersection(setTwo)
print(intersectionSet) // 1,2,3,4 common for both

// symmetric difference - method create new set without common elements and only elements different to each other letf
let difference = setOne.symmetricDifference(setTwo) // 5,6 - uncommon for both
print(difference)

// union - method create new set with elements from both sets, twins will be erased
let union = setOne.union(setTwo)
print(union)

// subtracting - method create new set of values that only setOne has
let subtracting = setOne.subtracting(setTwo)
print(subtracting)

// subSet & superSet
// check with == weither both sets have same elements
let superSetOf = setOne.isSuperset(of: setThree)
let subSetOf = setThree.isSubset(of: setOne)
let subSetOf1 = setOne.isSubset(of: setThree)
let superSetOf1 = setThree.isSuperset(of: setOne)
print(superSetOf, superSetOf1, subSetOf, subSetOf1)

// disjoint - return weither the both sets hava uncommon elemets
let disjointWith = setOne.isDisjoint(with: setFour)
print(disjointWith) // true

// Dictionaries - values associated with each other, [key: value], unordered
let fullDictionaryAnnotation: Dictionary<String, String> = ["PRG":"Praha", "ARN":"Arlando", "ROV":"Rostov-on-Don"]
let shortHandDict: [String: Int] = [:]
var someDict: [String: String] = fullDictionaryAnnotation
print(someDict)
// add new item
someDict["LAX"] = "Los Angeles"
// dictionary you add in->["NEW KEY"] = "NEW VALUE"
someDict["MIA"] = "miami, florida"
print(someDict)
// change old value
someDict["PRG"] = "Prague"
print(someDict)
// update old value via method
someDict.updateValue("Miami", forKey: "MIA")
someDict["VKO"] = "Vnukovo"
someDict["LED"] = "Pulkovo"
print(someDict)
// erase pair by key
someDict["VKO"] = nil
print(someDict)
someDict.removeValue(forKey: "LED")
print(someDict)

// methods
someDict.count // bool
someDict.isEmpty // bool
print(someDict.keys) // return only keys
someDict.values // return values

// loop thru
for key in someDict.keys {
    print(key)
}
for value in someDict.values {
    print(value)
}

for (key, value) in someDict {
    print("Airport \(key) is \(value)")
}

// control flow

