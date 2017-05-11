//: Playground - noun: a place where people can play

import UIKit

let name:String = "Changho Lee"
var nickName:String = "Ed"
var age:Int = 31
let gender:String = "Male"
var country:String = "South Korea"
var formerCountry:String = "US"

var spouse:String = "Semi Oh"
var spouseAge:Int = 28
var children:Int = 2
var kidName1:String = "Chloe"
var kidAge1:String = "19 months old"
var kidName2:String = "Jerome"
var kidAge2:String = "4 months old"

var currentJob:String = "Student"
var currentSalary:Int = 0

var graduatedSchool:String = "JB University"
var majorAtSchool:String = "Landscape Architecture"

var jobExp1:(jobTitle:String, jobPosition:String, yearOfExp:Double, salary1:Int) = ("Graphic", "Designer", 1, 30000)
var jobExp2:(jobTitle:String, jobPosition:String, yearOfExp:Double, salary2:Int) = ("Construction", "Project Manager", 2, 50000)

var currentActivity:String = "FastCampus"
var currentMajor:String = "iOS Developer"



print("Let me introduce my self, my name is \(name),")

if nickName != nil {
    print("and call me \(nickName) please.")
}

print("I'm \(age) years old.")
if age >= 30 {
    print("I know I'm pretty getting old.")
}

if spouse != nil {
print("I'm from \(country). And, I got married with my wife \(spouse) and she is \(spouseAge).")
}

if children > 0 {
print("also we have \(children) children, \(kidName1) and \(kidName2).")
print("\(kidName1) is \(kidAge1) whom was born in \(formerCountry), \(kidName2) is \(kidAge2).")
}

if jobExp1 != nil {
    print("I have experience being abroad in US around 3 year")
    print("my former job was \(jobExp1.0) \(jobExp1.1) for \(jobExp1.2) year.")
}
if jobExp2 != nil {
    print("Then I changed my job as my major what is \(majorAtSchool)")
}