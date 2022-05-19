//
//  InterfaceController.swift
//  iWatchDemo WatchKit Extension
//
//  Created by Sumendra on 18/05/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var btnGuess:WKInterfaceButton!
    @IBOutlet weak var sliderGuess:WKInterfaceSlider!
    @IBOutlet weak var lblGuess:WKInterfaceLabel!

    @IBOutlet weak var lblResult: WKInterfaceLabel!
    
    
    var guessNumber = 1
    

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        lblGuess.setText("Your guess: \(guessNumber)")

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func btnGuessTapped(){
        //btnGuess.setTitle("Tapped")
        let randomNumber = Int(arc4random_uniform(5))
        debugPrint("Random number is: \(randomNumber)")
           
           if(guessNumber == randomNumber) {
               lblResult.setText("\(randomNumber) is correct, You win!")
           } else {
               lblResult.setText("Wrong, Guessed number is \(randomNumber)")
           }
        
    }

    @IBAction func updateSliderValue(_ value: Float){
        guessNumber = Int(value * 1)
        lblGuess.setText("Your guess: \(guessNumber)")
        
    }
}
