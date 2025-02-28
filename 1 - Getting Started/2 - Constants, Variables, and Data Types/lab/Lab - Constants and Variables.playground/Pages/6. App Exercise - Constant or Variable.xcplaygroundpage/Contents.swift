/*:
 ## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
 - Name: The user's name
 - Age: The user's age
 - Number of steps taken today: The number of steps that a user has taken today
 - Goal number of steps: The user's goal for number of steps to take each day
 - Average heart rate: The user's average heart rate over the last 24 hours
 */
let userName = "Frank"
print("I chose to use a constant for this value because I do not imagine the user's name will change. This was a bit tricky because sometimes users enjoy being able to change their name, however for these purposes we will keep it constant")
var userAge = 23
print("Age is a variable because the user's age changes every year")
var numOfStepsToday = 3459
print("Number of steps every day is a variable because this changes constantly")
var goalNumSteps = 10000
print("Although goal number of steps is meant to be kept constant - because the user's goal should be consistent - I believe the user should be able to change their goal from time to time. Either because they cannot keep up with it and need to lower it or because they are finding it too easy and need to increase it")
var aveHeartRate =  78
print("Average heart rate should be a variable because it is generally not always the same")




/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 */
//: [Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
