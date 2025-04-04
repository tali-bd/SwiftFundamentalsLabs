/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description(){
        print("This book is called \(title) and the author is \(author). The total page number is \(pages) and it costs $\(price).")
    }
}

var newBook = Book(title: "Coding for Dummies", author: "Some Guy", pages: 500, price: 14.99)
newBook.description()
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message = String.init()
    var likes = Int.init()
    var numberOfComments = Int.init()
    
    mutating func like(){
        likes += 1
    }
}

var newPost = Post()

print(newPost.likes)

newPost.like()
newPost.like()
newPost.like()

print(newPost.likes)

//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
