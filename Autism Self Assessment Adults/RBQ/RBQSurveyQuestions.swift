//
//  RBQSurveyQuestions.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/23/23.
//

import Foundation

// Each question has an answer key to compare to the user's response.
// The score will increase by 1 if the response matches either answer in the scoringKey


let questionDictionaryRBQ = [
    1 : "Do you like to arrange items in rows or patterns?",
    2 : "Do you repetitively fiddle with items? (e.g. spin, twiddle, bang, tap, twist, or flick anything repeatedly?)",
    3 : "Do you like to spin yourself around and around?",
    4 : "Do you rock backwards and forwards, or side to side, either when sitting or when standing?",
    5 : "Do you pace or move around repetitively (e.g. walk to and fro across a room, or around the same path in the garden?)",
    6 : "Do you make repetitive hand and/or finger movements? (e.g. flap, wave, or flick your hands or fingers repetitively?)",
    7 : "Do you have a fascination with specific objects (e.g. trains, road signs, or other things?)",
    8 : "Do you like to look at objects from particular or unusual angles?",
    9 : "Do you have a special interest in the smell of people or objects?",
    10 : "Do you have a special interest in the feel of different surfaces?",
    11 : "Do you have any special objects you like to carry around?",
    12 : "Do you collect or hoard items of any sort?",
    13 : "Do you insist on things at home remaining the same? (e.g. furniture staying in the same place, things being kept in certain places, or arranged in certain ways?)",
    14 : "Do you get upset about minor changes to objects (e.g. flecks of dirt on your clothes, minor scratches on objects?)",
    15 : "Do you insist that aspects of daily routine must remain the same?" ,
    16 : "Do you insist on doing things in a certain way or re-doing things until they are 'just right'?"  ,
    17 : "Do you play the same music, game or video, or read the same book repeatedly?" ,
    18 : "Do you insist on wearing the same clothes or refuse to wear new clothes?"  ,
    19 : "Do you insist on eating the same foods, or a very small range of foods, at every meal?"  ,
    20 : "If you are left to occupy yourself, will you choose from a restricted range of repetitive activities?"
    ]



//struct AnswersRBQ {
//    var text: String
//    var score: ScoreRBQ
//}

enum ScoreRBQ {
    case never, oneOrMore, fifteenOrMore, thirtyOrMore
    
    var choice: Int {
        switch self {
        case .never:
            return 1
        case .oneOrMore:
            return 2
        case .fifteenOrMore:
            return 3
        case .thirtyOrMore:
            return 3
        }
    }
}


