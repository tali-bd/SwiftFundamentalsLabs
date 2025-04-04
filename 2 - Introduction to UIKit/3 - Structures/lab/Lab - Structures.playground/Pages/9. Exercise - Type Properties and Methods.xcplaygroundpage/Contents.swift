/*:
 ## Exercise - Type Properties and Methods
 
 Imagine you have an app that requires the user to log in. You may have a `User` struct similar to that shown below. However, in addition to keeping track of specific user information, you might want to have a way of knowing who the current logged in user is. Create a `currentUser` type property on the `User` struct below and assign it to a `user` object representing you. Now you can access the current user through the `User` struct. Print out the properties of `currentUser`.
 */
struct User {
    static var currentUser = User(userName: "NatB", email: "nat@email.com", age: 26) //Dummy values to represent last user logged in
    var userName: String
    var email: String
    var age: Int
    
    static func logIn(userSigningIn: User) //function to let user log in and pass values this way, allows us to change values of currentUser
    {
        currentUser = userSigningIn
        print("\(userSigningIn.userName) has logged in")
    }
}

print(User.currentUser)
var user2 = User(userName: "New user", email: "newUser@email.com", age: 32) //create an instance
User.logIn(userSigningIn: user2) //now a new user has logged in

print(User.currentUser) //want to check that currentUser has updated to new user

var user3 = User(userName: "thirdUser", email: "user3@email.com", age: 34)
User.logIn(userSigningIn: user3)

/*:
 There are other properties and actions associated with a `User` struct that might be good candidates for a type property or method. One might be a method for logging in. Go back and create a type method called `logIn(user:)` where `user` is of type `User`. In the body of the method, assign the passed in user to the `currentUser` property, and print out a statement using the user's userName saying that the user has logged in.
 
 Below, call the `logIn(user:)` method and pass in a different `User` instance than what you assigned to currentUser above. Observe the printout in the console.
 */


//: [Previous](@previous)  |  page 9 of 10  |  [Next: App Exercise - Type Properties and Methods](@next)
