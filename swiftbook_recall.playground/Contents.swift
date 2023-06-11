// June 3 2023

import Foundation
import UIKit

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
 String - are the symbols surrounded with double quotes
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
let myInt = 8

var myFloatingPointNums = Double(myInt) + myDouble
print(myFloatingPointNums)

// type alias - reference to existing data type
typealias AudioSample = UInt16
let maxAmplitude = AudioSample.min

// Bool type - false/true

// Tuples - group of values of many different types, same types are also supported
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
// opt may be unwrapped

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
    guard b != 0 else { throw NSError(domain: "custom description - cause of an error: can't divide by zero, only Chuck Norris can. code", code: 0) }
    return a / b
}

// func caller do/try/catch
do {
    try division(a: 3, b: 1)
} catch {
    print(error.localizedDescription) // loacalized description is a NSError(domain)
}

// error handling as an optional value
let result = try? division(a: 3, b: 1)
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
let someValue = true // A
let answ1 = "condition B"
let answ2 = "condition C"
if someValue{ // a
    print(answ1) // b
} else {
    print(answ2) // c
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
let aRem = 9
let bRem = 4
var reminder = aRem % bRem
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

// String - to create use String literals - sequence of characters(char) surrounded by double quotes "String"
let literallyString: String = "This is String literals"
// multiline strings
let multiline = """
    this is a multiline string
    each new line must be started after four whitespaces
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
// string concatenation
var concatination = literallyString + multiline + " Hello, World!"
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
let directChar = loopThru[3] // "p"

// insert & remove
let exclamation: Character = "!"
loopThru.append(exclamation)
loopThru.removeLast()
var hello = "hello"
hello.insert(contentsOf: ", world", at: hello.endIndex) // hello(.endIndex), world
hello.remove(at: hello.index(hello.startIndex, offsetBy: 5))
// also may be read as remove from, variable called "hello", and its index: start from index 5

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
print(ignoredItems.count) // 6 unique values
// same methods can be used
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

// union - method create new set with elements from both sets, only unique items
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

// disjoint - return weither the both sets have uncommon elemets
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
// there are statements in Swift to control flow of code execution
// while - perform tasks until some condition become false
// if, guard, switch - for execution of different branches of code depending on conditions
// break, continue - passing flow to the next block of code
// for in loop - to iterate thru dicts, arrays, sets, strings

// switch - cases can be used with WHERE for each case

// for in loop - can be used with dictionaries, decompose it to tuple
var legs = ["Cat":4, "Human":2]
for (animal, numOfLegs) in legs { // creating tuple
    print("\(animal) has \(numOfLegs) legs")
}

// if specific sequence is not needed you can ignore temp variable in "for in loop" using "_" underscore
let iterations = 10
let multiplier = 4
var operand = 1
for _ in 1...iterations {
    operand *= multiplier
    print(operand)
}

let namesAr = ["Paul", "Sam", "Hank"]
for i in namesAr {
    print("Hello, \(i)")
}

// while loop - checks if condition is true before each new iteration, executes til condition is true
var countDown = 19
while countDown != 0 {
    countDown -= 1
    print("T-minus \(countDown)")
}
if countDown == 0 {
    print("we have lift off!!!")
}

// repeat-while loop execute first and then checks if condition is true
var numberOne = 0
repeat {
    print("current number is \(numberOne)")
    numberOne += 1
} while numberOne < 10
print("final number is \(numberOne)")

// June 8 2023

// switch - matching items with possible values
let lookingForValue = "Spring"
switch lookingForValue {
    case "Summer":
        print("Finally summer!")
    case "Spring":
        print("Hooray! it's spring")
    default:
        print("It must be autumn or winter")
}
// switch must be exhaustive, it means you need to set all possible condition, default case needed

// matching intervals
let intervalValue = 62
switch intervalValue {
    case 0:
        print("you value is equal to zero")
    case 1...20:
        print("your value is in interval from 1 to 20")
    case 21...70:
        print("your value is in interval from 21 to 100")
    default:
        print("your value out of intervals")
}

// two values in  one case
let letterA = "a"
switch letterA {
    case "a", "A":
        print("your letter is A")
    case "b", "B":
        print("your letter is B")
    default:
        print("try another alphabet")
}

// tuples in swicth
// allows to use multiple values in switch statement
// each element of tuple may be checked with different values or interlav values
// you can use _ - wildcard pattern to skip one value

// value bindings
var scores = (56, 67)
switch scores {
    case(0,0):
        print("you have no scores, begin test get scores")
    case(100, 100):
        print("Perfect scores!")
    case(_, 60...100):
        print("Swift theory passed")
    case(55...99, _):
        print("Swift coding passed")
    default:
        print("both failed")
}

// where
switch scores {
    case (0,0):
        print("begin test")
    case (100, 100):
        print("prefect scores")
    case let (theory, practice) where theory >= 60 && practice >= 55:
        print("passed both")
    default:
        print("both failed")
}

// compaund cases
let someChar = "u"
switch someChar {
case "a","o","u","e", "i":
    print("this is a vovel")
default:
    print("this is a consonant")
}

// control tranfer statemets
//  break, continue, fallthrough

// break - conditional code: if true -> continue, else -> break
var checkCount = 100
while checkCount != 0 {
    checkCount -= 5
    print(checkCount)
    if checkCount == 25 {
        break
    }
}

// continue
var anotherCount = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
for i in anotherCount {
    anotherCount.removeFirst()
    print("count is \(anotherCount.count)")
    if anotherCount.isEmpty {
        continue
    }
    anotherCount.append(i)
    print("the value is \(anotherCount)")
    
}

// fallthrough
switch checkCount {
    case 2...88, 89...100:
        print("Not sure if I understand fallthrough at 100%")
        fallthrough // will skip this case
    case -1...1:
        print("this message came from case that stand after fallthru")
default:
    print("I think I get it")
}

// check for API availability
// swift automaticaly checking API availability, to make sure you don't accidentally use API that unavailable on deployment target
if #available(iOS 15, *) {
    // use iOS 15 API
} else {
    // fall back to earlier iOS APIs
}
// * asterix - required and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target

@available(macOS 10.15, *)
struct ColorPreference {
    var bestColor = "blue"
}
func chooseBestColor() -> String {
    guard #available(macOS 10.15, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}
 

// functions - blocks of code that performs a specific tasks
// to use func -> define one -> call func()

// func (no parameter) no return
func doWork() {
    let smth1 = 4
    let smth2 = 9
    let sum = smth2+smth1
    print(sum)
}
doWork()

func takeParametersNoReturn(parameterLabel parameterName: Int, by b: Int) {
    let sum = parameterName * b
    print(sum)
}

takeParametersNoReturn(parameterLabel: 5, by: 6)

func takeUnnamedParameter(_ a: Int, by b: Int) {
    print(a * b)
}
takeUnnamedParameter(9, by: 5)

func returnValueNoParam() -> Int {
    return 5 * 5
}
returnValueNoParam()

func takeParamReturnValue(param: Int, pampam: Int) -> String {
    let calc = param * pampam
    let cast = String(calc)
    return cast
}
takeParamReturnValue(param: 5, pampam: 7)

func returnMultiplyParam() -> (String, Double) {
    let score = 1.67
    let name = "Dave"
    return ("Dave achieved", score)
}
returnMultiplyParam()


//closures
// anonymus func, unnamed, aka lambda

do { //called with keyword "do"
    print("this is a message from simple closure")
}
//  {(parameter)->return type in - keyword "in" is optional, separates closure definition from its body
//      statement
//}

// closure is a reference type

// define closure
let closure = { // reference to closure
    print("hello from closure") // closure body
}
closure() // call closure

// closure take parameters
var dogBark = {(name: String) in
    print("\(name) is barking")
}
dogBark("Portos")

// closure takes parameters and return values

let findArea = {(num: Int) -> (Int) in
    let area = num * num
    return area
}

findArea(3)

// anonymous value
let rectArea: (Int) -> (Int) = { $0 * $0 }
// const reference to int->int closure, which is a multiplication on it self $0-1st param, $1-2nd param(if exist) and so on
print(rectArea(5))
// with two or more parameters
let rectArea2: (Int, Int, Int) -> (Int) = { ($0 * $1) / $2 }
print(rectArea2(9, 7, 4))


// closure as func parameter
func getPizza(search: () -> ()) {
    print("let's find some pizza")
    
    // call closure
    search()
}

// passing closure to func
getPizza(search: {
    print("pizzahut is 4 km away")
})
// capture values from scope
func someFunc(x: Int) -> (()-> Int) { // takes int and return closure
    let closure = { x * 8 } // capturing value
    return closure
}
let captureOne = someFunc(x: 5)
let captureTwo = someFunc(x: 6)
captureOne()
captureTwo()

//June 11 2023

// Enumerations - set the common type for group of related values and allow safety work with it
// is case of enum has a value it's called raw value, and it could be String, Char, Int, Double, Float
enum CompasPoint {
    case north
    case south
    case west // enumeration case
    case east
}

// multiple cases with all possible cases in one line
enum Planet { // enum name is always singular and Capitalized
    case mercury, venus, earth, mars, jupiter, saturn
}

enum PlanetList {
    case mercury
    case venus
    case earth
    case mars
}
// each enum case defines new type
var direction = CompasPoint.north
var myPlanet = Planet.earth
myPlanet = .mercury
// switch with enum matching values
switch direction {
case .north:
    print("Direction is North")
case .south:
    print("Direction is S")
case .east:
    print("Direction is E")
    // do smthg, call func, set new value to some var
case .west:
    print("Direction is W")
}

func choseSpacetravel(orbitOf selection: PlanetList) {
    switch selection {
    case .mercury:
        print("let's go the first from the Sun")
    case .venus:
        print("greenhouse effect, high pressure and 280 degrees Celsius - great choice")
    case .mars:
        print("Go Elon!")
    case .earth:
        print("home, sweet home")
    // no need default case when matching enum
    }
}

choseSpacetravel(orbitOf: .venus)

// associated values - may be a different data types
enum Barcode {
    case upc (Int, Int) // define type of valu but doesn't have a value
    case qr (String)
}
var newCode = Barcode.upc(8, 111332123)

enum Element {
    case helium(atomicMass: Double)
    case carbon(atomicMass: Double)
    case hydrogen(atomicMass: Double)
}
func getAtomicMass(for element: Element) {
    switch element {
    case .carbon(let atomicMass):
        if atomicMass ==  12.011{
            print("this is carbon")
        }
    case .helium(let atomicMass) where atomicMass >= 4.002602:
        print("this is helium")
    case .hydrogen(let atomicMass):
        if atomicMass == 1.00784 {
            print("this is hydrogen")
        }
    default:
        print("unknown element")
    }
}
getAtomicMass(for: .carbon(atomicMass: 12.011))

enum Social {
    case twitter(followers: Int)
    case youtube(subscibers: Int)
}

func getSponsorshipEligibility(for platfom: Social) {
    switch platfom {
    case .twitter(let followers) where followers > 10_000:
        print("Eligible for sponsorship")
    case .youtube(let subscibers) where subscibers > 25_000:
        print("Eligible for sponsorship")
    case .twitter, .youtube:
        print("Not eligible for sponsorship")
    }
}
getSponsorshipEligibility(for: .twitter(followers: 2000))

// raw values
enum Value: Int {
    case one = 1 // 1 is a raw value
}

enum Device: String, CaseIterable {
    case infinix  = "My astronomical android buddy, with NFC btw"
    case iphone   = "My little 12"
    case mbp2012  = "Old buddy of mine, always helped me out"
    case ipad     = "finally I got it"
}
// access to rawValue
func getOpinion (about device: Device) {
    let opinion = device.rawValue
    print(opinion)
}
getOpinion(about: .infinix)
getOpinion(about: .mbp2012)

enum AnotherPlanet: Int {
    case mercury = 1
    case venus
}
let hotPlanet = AnotherPlanet(rawValue: 1)

// iterate
enum Drink: CaseIterable { // puts all cases into a collection
    case coffee
    case tea
    case soda
}
print(Drink.allCases.count)
for drink in Drink.allCases {
    print(drink)
}

for opinion in Device.allCases {
    print(opinion.rawValue)
}
