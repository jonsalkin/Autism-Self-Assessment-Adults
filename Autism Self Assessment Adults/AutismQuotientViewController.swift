//
//  ViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 3/3/23.
//

import UIKit

class AutismQuotientViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var definitelyAgreeButton: UIButton!
    @IBOutlet var slightlyAgreeButton: UIButton!
    @IBOutlet var slightlyDisagreeButton: UIButton!
    @IBOutlet var definitelyDisagreeButton: UIButton!
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
        buttons = [definitelyAgreeButton, slightlyAgreeButton, slightlyDisagreeButton, definitelyDisagreeButton]
        displayQuestion()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Checks whether the back button was pressed.
        // If so, the current Dictionary of responses will be reset to empty.
        if isMovingFromParent {
            resetCurrentResponseArray()
        }
    }

    
    
    //MARK: - IBActions
    // Before one of the four buttons are selected, they are outlined in gray.
    // When one of the four 'response' buttons are chosen in response to the displayed question,
    // the chosen button is highlighted in blue, the other buttons stay gray.
    // The title of the chosen button is stored in the 'userResponse' variable, then
    // the continue button is highlighted and enabled for selection.
    @IBAction func responseButtonPressed(_ sender: UIButton) {
        for button in buttons {
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        sender.layer.borderColor = UIColor.blue.cgColor
        userResponse = sender.currentTitle
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
        if questionNumberIndex < 10 {
            addToCurrentResponseArray()
            resetUI()
            continueButton.isEnabled = false
            print(questionNumberIndex)
            questionNumberIndex += 1
            displayQuestion()
        } else if questionNumberIndex == 10 {
            addToCurrentResponseArray()
            questionNumberIndex += 1
            print(questionNumberIndex)
            setResultsButton()
            resetUI()
            disableButtons()
            questionLabel.text = "Well done.\n\nClick continue to see results."
        } else {
            totalScore = scoreResponses()
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
        resetButtonState(button: definitelyAgreeButton)
        resetButtonState(button: slightlyAgreeButton)
        resetButtonState(button: slightlyDisagreeButton)
        resetButtonState(button: definitelyDisagreeButton)
    }
    
    // Adds user response to a single question into an array. Called on after each of the 50 questions.
    func addToCurrentResponseArray() {
        currentResponses.insert(userResponse!, at: (questionNumberIndex - 1))
        print(currentResponses)
    }
    
    // After all 50 questions have been responded to by the user, the array is emptied for future surveys.
    func resetCurrentResponseArray() {
        currentResponses.removeAll()
        print("Current Responses in Array: \(currentResponses)")
    }
    
    // Pulls a survey question from the question dictionary based on the key: questionNumberIndex.
    func displayQuestion() {
        questionLabel.text = questionDictionary[questionNumberIndex]
    }
    
    // Function to compare all the users 50 responses to the answer key.
    // Each response is then scored 0 or 1 point after comparing the response to the answer key.
    // The total score is summed and returned to where the function was called.
    func scoreResponses() -> Int {
        var score = 0
        var keyIndex = 1
        
        for response in currentResponses {
            let lowercasedResponse = response.lowercased()
            
            if let answerKeyAnswer = answerKeyDictionary[keyIndex]?.lowercased(),
               answerKeyAnswer.contains(lowercasedResponse) {
                score += 1
                keyIndex += 1
            } else {
                keyIndex += 1
            }
            
        }
        return score
    }
    
    // Function to change the Continue button to 'See Results'.
    func setResultsButton() {
        continueButton.setTitle("See Results", for: .normal)
        }
 
    // Function to disable and hide all four survey buttons.
    func disableButtons() {
        definitelyAgreeButton.isEnabled = false
        slightlyAgreeButton.isEnabled = false
        slightlyDisagreeButton.isEnabled = false
        definitelyDisagreeButton.isEnabled = false
        
        definitelyAgreeButton.isHidden = true
        slightlyAgreeButton.isHidden = true
        slightlyDisagreeButton.isHidden = true
        definitelyDisagreeButton.isHidden = true
    }
    
    
}
