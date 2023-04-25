//
//  RBQViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/23/23.
//

import UIKit

class RBQViewController: UIViewController {

    
        
        //MARK: - IBOutlets
        @IBOutlet weak var questionLabel: UILabel!
        @IBOutlet var neverOrRarelyButton: UIButton!
        @IBOutlet var oneOrMoreDailyButton: UIButton!
        @IBOutlet var fifteenOrMoreDailyButton: UIButton!
        @IBOutlet var thirtyOrMoreDailyButton: UIButton!
        @IBOutlet var continueButton: UIButton!
        
        
        
        
        //MARK: - Instance Properties
        var buttons: [UIButton] = []
        var questionNumberIndex: Int = 1
        var userResponse: String? = nil

        
        
        //MARK: - VDL
        override func viewDidLoad() {
            super.viewDidLoad()
            resetUI()
            
            // Adds all four selection buttons into an array named 'buttons'.
            buttons = [neverOrRarelyButton, oneOrMoreDailyButton, fifteenOrMoreDailyButton, thirtyOrMoreDailyButton]
            displayQuestion()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            // Checks whether the back button was pressed.
            // If so, the current Dictionary of responses will be reset to empty.
            if isMovingFromParent {
                resetCurrentTotalScoreRBQ()
            }
        }

        
        
        //MARK: - IBActions
        // Before one of the four buttons are selected, they are outlined in gray.
        // When one of the four 'response' buttons are chosen in response to the displayed question,
        // the chosen button is highlighted in blue, the other buttons stay gray.
        // The title of the chosen button is stored in the 'userResponse' variable, then
        // the continue button is highlighted and enabled for selection.
        var selectedScore: ScoreRBQ?
    
        @IBAction func responseButtonPressed(_ sender: UIButton) {
            for button in buttons {
                button.layer.borderColor = UIColor.lightGray.cgColor
            }
            sender.layer.borderColor = UIColor.blue.cgColor
            userResponse = sender.currentTitle
            
            print("Button tag: \(sender.tag)")
            
            switch sender.tag {
              case 1:
                  selectedScore = .never
              case 2:
                  selectedScore = .oneOrMore
              case 3:
                  selectedScore = .fifteenOrMore
              case 4:
                  selectedScore = .thirtyOrMore
              default:
                  return
              }
//            totalScoreRBQ += selectedScore?.choice ?? 0
            print("The totalScoreRBQ: \(totalScoreRBQ)")
            continueButton.isEnabled = true
        }
        
        // When the Continue button is pressed, the IBAction function checks the question dictionary's index after
        // for question to see if it has reached the last question of 50.
        // If it has not, pressing continue adds the response to the 'CurrentResponsArray'.
        // The user interface is then reset for each question.
        // It then pulls the next question from the question dictionary.
        //
        // Once the index reaches 50, the continue button changes to 'See Results', the other buttons are disabled
        // and the label displays a message of completion.
        // The control flow will then lead to the final 'else' to store the score in the 'totalScore' variable.
        // A segue to the results page occurs finally.
        @IBAction func continueButtonPressed(_ sender: UIButton) {
            if questionNumberIndex < 20 {
                if let score = selectedScore {
                    totalScoreRBQ += score.choice // Add previously selected score to totalScore
                }
                resetUI()
                continueButton.isEnabled = false
                print("Question# Index: \(questionNumberIndex)")
                questionNumberIndex += 1
                displayQuestion()
            } else if questionNumberIndex == 20 {
                if let score = selectedScore {
                            totalScoreRBQ += score.choice // Add previously selected score to totalScore
                }
                questionNumberIndex += 1
                print("Question# Index: \(questionNumberIndex)")
//                setResultsButton()
                resetUI()
                disableButtons()
                questionLabel.text = "Well done.\n\nClick continue to see results."
            } else {
                performSegue(withIdentifier: "segueToResultsPage", sender: sender)
            }
        }
        
        
        
        // When the naviagation 'back' button is pressed, the user navigates back to the Welcome home page.
        @IBAction func unwindToWelcome(unwindSegue: UIStoryboardSegue) {
            
        }
        
        
        
        
        //MARK: - Instance Methods
        
        // Changes a button's color to representing the state of deselection.
        func resetButtonState(button: UIButton) {
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 5.0
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 1.0
        }
        
        // Resets all four buttons to gray, representing a deselected state.
        func resetUI() {
            resetButtonState(button: neverOrRarelyButton)
            resetButtonState(button: oneOrMoreDailyButton)
            resetButtonState(button: fifteenOrMoreDailyButton)
            resetButtonState(button: thirtyOrMoreDailyButton)
        }
        
     
        
        // After all 20 questions have been responded to by the user, the array is emptied for future surveys.
        func resetCurrentTotalScoreRBQ() {
            totalScoreRBQ = 0
            print("Current Total Score: \(totalScoreRBQ)")
        }
        
        // Pulls a survey question from the question dictionary based on the key: questionNumberIndex.
        func displayQuestion() {
            questionLabel.text = questionDictionaryRBQ[questionNumberIndex]
        }
        

        
        // Function to change the Continue button to 'See Results'.
        func setResultsButton() {
            continueButton.setTitle("See Results", for: .normal)
            continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 28.0, weight: .heavy)
            }
    

     
        // Function to disable and hide all four survey buttons.
        func disableButtons() {
            neverOrRarelyButton.isEnabled = false
            oneOrMoreDailyButton.isEnabled = false
            fifteenOrMoreDailyButton.isEnabled = false
            thirtyOrMoreDailyButton.isEnabled = false
            
            neverOrRarelyButton.isHidden = true
            oneOrMoreDailyButton.isHidden = true
            fifteenOrMoreDailyButton.isHidden = true
            thirtyOrMoreDailyButton.isHidden = true
        }
        
        
    }
