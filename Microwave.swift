// Copyright (c) 2024 Chris Di Bert All rights reserved.
// .
// Created by: Christopher Di Bert
// Date : Feb.29, 2024
// Microwave time calculator.

import Foundation

func main() {
    // Array of available foods to microwave.
    let foodItems: [String] = ["Pizza", "Sub", "Soup"]
    // Displays available food to microwave.
    print("~Food~")
    for i in 0...(foodItems.count - 1) {
        print("\(i+1). \(foodItems[i])")
    }

    print("Choose the number of the item you want to microwave: ", terminator: "")

    // Gets the user's choice of food.
    if let foodChoiceStr = readLine(), let foodChoice = Int(foodChoiceStr) {
        // Checks if the user's choice exists in the list.
        if foodChoice >= 1 && foodChoice <= 3 {
            print("Enter how many you want to microwave (1-3): ", terminator: "")
            // Gets the amount of food to microwave.
            if let quantityStr = readLine(), let quantity = Int(quantityStr) {
                // Checks if the amount to microwave is in range.
                if (quantity >= 1 && quantity <= 3) {
                    // Calculates the amount of time it will take to microwave.
                    let time = CalculateTime(food: foodChoice, foodCount: quantity)
                    let minutes: Int = Int(time) / 60
                    let seconds: Int = Int(time) % 60
                    // Displays the time it will take to microwave.
                    print("It will take \(minutes) minutes and \(seconds) seconds to microwave.")
                }
                // If the user's quantity is out of bounds.
                else {
                    print("You can only microwave 1, 2, or 3 at a time!")
                }
                // If the user did not enter an integer for quantity.
            } else {
                print("You must enter an integer value for the quantity of food!")
            }
            // If the user entered a food that doesn't exist.
        } else {
            print("Your selection is not on the list!")
        }
        // If the user's food selection isn't an integer.
    } else {
        print("Your selection must be an integer!")
    }
}

// Function to calculate the time it takes to microwave.
func CalculateTime(food: Int, foodCount: Int) -> Float {
    // Initialized variable to keep track of time.
    var totalTime: Float = 0

    // Checks which food user selected and adds time accordingly.
    switch food {
    case 1: // Pizza
        totalTime += 45
    case 2: // Sub
        totalTime += 60
    default: // Soup
        totalTime += 105
    }

    // Applies quantity modifier to the time retrieved by food type.
    switch foodCount {
    case 2:
        totalTime *= 1.5
    case 3:
        totalTime *= 2.0
    default:
        break
    }

    return totalTime
}
main()