//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        //Call nextQuestion function to display question during initial load
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
       
        //Assign "true" if True button is pressed
        if sender.tag == 1 {
            pickedAnswer = true
        }
        //Assign "false" if False button is pressed
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        //Call function to check the answer
        checkAnswer()
        
        //Set the question number to next question and then run the function
        questionNumber = questionNumber + 1
        nextQuestion()
        
  
    }
    
    
    func updateUI() {
      
        //Update the Score Label, Progress Label, Progress bar
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        
        //Divide the screen length by 13 and then increase by each question number
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        //List the question on the screen, then update the UI if question number is within range
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        }
        else {
           //Create an alert when the question number is out of rance
            let alert = UIAlertController(title: "Awesome", message: "You have finished the questions. Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        //Set variable for correct answer
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        //Show an alert when answer is correct
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        }
        //Show an alert when answer is wrong
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        
        //Reset the variables, then run nextQuestion function
       questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
