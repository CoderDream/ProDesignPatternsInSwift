import UIKit

var str = "Hello, playground"

var counter = 0
var secondCounter = 0

for i in 0 ..< 10 {
    counter += i
    print("Counter: \(counter)");
    for j in 0 ... 10 {
        secondCounter += j
    }
}
