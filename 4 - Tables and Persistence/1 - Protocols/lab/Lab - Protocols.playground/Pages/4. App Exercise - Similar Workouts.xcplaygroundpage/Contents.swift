/*:
 ## App Exercise - Similar Workouts
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Previously in app exercises, you've used inheritance to enforce similar behavior between different kinds of workouts. However, you can enforce this behavior between different workouts using protocols.
 
 Create a protocol `Workout` with two requirements: a settable property called `distance` and a settable property called `time`, both of type `Double`.
 */
protocol Workout{
    var distance: Double {get}
    var time: Double {get}
}

/*:
 Create two structs, `RunningWorkout` and `SwimmingWorkout`. Both should conform to the `Workout` protocol. Uncomment the function `simpleWorkoutDescription` below, create an instance of each of your structs, and call `simpleWorkoutDescription` twice, passing in a `RunningWorkout` object and then a `SwimmingWorkout` object.
 */
struct RunningWorkout: Workout{
    var distance: Double { return 23.1 }
    var time: Double { return 114.3 }
}

struct SwimmingWorkout: Workout{
    var distance: Double { return 32.9 }
    var time: Double { return 35.4 }
}

func simpleWorkoutDescription(workout: Workout) {
    print("You went \(workout.distance) meters in \(workout.time) seconds.")
}

var run1 = RunningWorkout()
var swim1 = SwimmingWorkout()

simpleWorkoutDescription(workout: run1)
simpleWorkoutDescription(workout: swim1)

//: [Previous](@previous)  |  page 4 of 5  |  [Next: App Exercise - Heart Rate Delegate](@next)
