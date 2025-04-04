/*:
 ## Exercise - Computed Properties and Property Observers
 
 The `Rectangle` struct below has two properties, one for width and one for height. Add a computed property that computes the area of the rectangle (i.e. width * height). Create an instance of `Rectangle` and print the `area` property.
 */
struct Rectangle {
    var width: Int
    var height: Int
    
    var area : Int{
        width * height
    }
}

var thisRect = Rectangle(width: 4, height: 9)
print(thisRect.area)
/*:
 In the `Height` struct below, height is represented in both inches and centimeters. However, if `heightInInches` is changed, `heightInCentimeters` should also adjust to match it. Add a `didSet` to each property that will check if the other property is what it should be, and if not, sets the proper value. If you set the value of the other property even though it already has the right value, you will end up with an infinite loop of each property setting the other.
 
 Create an instance of `Height` and then change one of its properties. Print out the other property to ensure that it was adjusted accordingly.
 */
struct Height {
    var heightInInches: Double{
        
        didSet{
            
            if(heightInCentimeters == heightInInches * 2.54){
                print("Set heightInCentimers to: \(heightInCentimeters)")
            }
            else{
                heightInCentimeters = heightInInches * 2.54
                print("Set heightInCentimers to: \(heightInCentimeters)")
            }
        }
}
    
    
    var heightInCentimeters: Double{
        
         didSet{
             if(heightInInches == heightInCentimeters / 2.54){
                 print("Set heightInInches to: \(heightInInches)")
             }
             else{
                 heightInInches = heightInCentimeters / 2.54
             }
        }
    }
        
    init(heightInInches: Double) {
        self.heightInInches = heightInInches
        self.heightInCentimeters = heightInInches*2.54
    }
    
    init(heightInCentimeters: Double) {
        self.heightInCentimeters = heightInCentimeters
        self.heightInInches = heightInCentimeters/2.54
    }
}


//When initializing variable for the first time, init() is called, var at top is ignored, because it is considered a function. Will not be called until call to function is made. This means inches and centimeters will be initialized as 0.0 each

var testHeight = Height(heightInInches: 0.0)
print(testHeight.heightInInches)  //Acts as a getter

//When setting new value to
testHeight.heightInInches = 60.2   // Goes through both init and struct functions
print(testHeight.heightInCentimeters)
//: [Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Mile Times and Congratulations](@next)
