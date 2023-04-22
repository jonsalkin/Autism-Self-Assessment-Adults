//
//  SurveyQuestions.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 3/3/23.
//

import Foundation


    
//struct Survey {
//
    // Each question has an answer key to compare to the user's response.
    // The score will increase by 1 if the response matches either answer in the scoringKey
    
let questionDictionary = [
        1 : "I prefer to do things with others rather than on my own.",
        2 : "I prefer to do things the same way over and over again.",
        3 : "If I try to imagine something, I find it very easy to create a picture in my mind.",
        4 : "I frequently get so strongly absorbed in one thing that I lose sight of other things.",
        5 : "I often notice small sounds when others do not.",
        6 : "I usually notice car number plates or similar strings of information.",
        7 : "Other people frequently tell me that what I’ve said is impolite, even though I think it is polite.",
        8 : "When I’m reading a story, I can easily imagine what the characters might look like.",
        9 : "I am fascinated by dates.",
        10 : "In a social group, I can easily keep track of several different people’s conversations.",
        11 : "I find social situations easy.",
        12 : "I tend to notice details that others do not.",
        13 : "I would rather go to a library than to a party.",
        14 : "I find making up stories easy.",
        15 : "I find myself drawn more strongly to people than to things." ,
        16 : "I tend to have very strong interests, which I get upset about if I can’t pursue."  ,
        17 : "I enjoy social chitchat." ,
        18 : "When I talk, it isn’t always easy for others to get a word in edgewise."  ,
        19 : "I am fascinated by numbers."  ,
        20 : "When I’m reading a story, I find it difficult to work out the characters’ intentions."  ,
        21 : "I don’t particularly enjoy reading fiction."  ,
        22 : "I find it hard to make new friends."  ,
        23 : "I notice patterns in things all the time."  ,
        24 : "I would rather go to the theater than to a museum." ,
        25 : "It does not upset me if my daily routine is disturbed." ,
        26 : "I frequently find that I don’t know how to keep a conversation going."  ,
        27 : "I find it easy to “read between the lines” when someone is talking to me." ,
        28 : "I usually concentrate more on the whole picture, rather than on the small details." ,
        29 : "I am not very good at remembering phone numbers." ,
        30 : "I don’t usually notice small changes in a situation or a person’s appearance." ,
        31 : "I know how to tell if someone listening to me is getting bored." ,
        32 : "I find it easy to do more than one thing at once." ,
        33 : "When I talk on the phone, I’m not sure when it’s my turn to speak.",
        34 : "I enjoy doing things spontaneously." ,
        35 : "I am often the last to understand the point of a joke."  ,
        36 : "I find it easy to work out what someone is thinking or feeling just by looking at their face." ,
        37 : "If there is an interruption, I can switch back to what I was doing very quickly." ,
        38 : "I am good at social chitchat." ,
        39 : "People often tell me that I keep going on and on about the same thing."  ,
        40 : "When I was young, I used to enjoy playing games involving pretending with other children." ,
        41 : "I like to collect information about categories of things (e.g., types of cars, birds, trains, plants)."  ,
        42 : "I find it difficult to imagine what it would be like to be someone else."  ,
        43 : "I like to carefully plan any activities I participate in."  ,
        44 : "I enjoy social occasions." ,
        45 : "I find it difficult to work out people’s intentions."  ,
        46 : "New situations make me anxious."  ,
        47 : "I enjoy meeting new people." ,
        48 : "I am a good diplomat." ,
        49 : "I am not very good at remembering people’s date of birth." ,
        50 : "I find it very easy to play games with children that involve pretending."
    ]
    

// The user response for each question will be compared to the answer values.
// If the user response matches either answer values, the score will increase by one.
 let answerKeyDictionary = [
        1 :  "Slightly disagree Definitely disagree" ,
        2 :  "Definitely agree Slightly agree" ,
        3 :  "Slightly disagree Definitely disagree" ,
        4 :  "Definitely agree Slightly agree" ,
        5 :  "Definitely agree Slightly agree" ,
        6 :  "Definitely agree Slightly agree" ,
        7 :  "Definitely agree Slightly agree" ,
        8 :  "Slightly disagree Definitely disagree" ,
        9 :  "Definitely agree Slightly agree" ,
        10 :  "Slightly disagree Definitely disagree" ,
        11 :  "Slightly disagree Definitely disagree" ,
        12 :  "Definitely agree Slightly agree" ,
        13 :  "Definitely agree Slightly agree" ,
        14 :  "Slightly disagree Definitely disagree" ,
        15 :  "Slightly disagree Definitely disagree" ,
        16 :  "Definitely agree Slightly agree" ,
        17 :  "Slightly disagree Definitely disagree" ,
        18 :  "Definitely agree Slightly agree" ,
        19 :  "Definitely agree Slightly agree" ,
        20 :  "Definitely agree Slightly agree" ,
        21 :  "Definitely agree Slightly agree" ,
        22 :  "Definitely agree Slightly agree" ,
        23 :  "Definitely agree Slightly agree" ,
        24 :  "Slightly disagree Definitely disagree" ,
        25 :  "Slightly disagree Definitely disagree" ,
        26 :  "Definitely agree Slightly agree" ,
        27 :  "Slightly disagree Definitely disagree" ,
        28 :  "Slightly disagree Definitely disagree" ,
        29 :  "Slightly disagree Definitely disagree" ,
        30 :  "Slightly disagree Definitely disagree" ,
        31 :  "Slightly disagree Definitely disagree" ,
        32 :  "Slightly disagree Definitely disagree" ,
        33 :  "Definitely agree Slightly agree" ,
        34 :  "Slightly disagree Definitely disagree" ,
        35 :  "Definitely agree Slightly agree" ,
        36 :  "Slightly disagree Definitely disagree" ,
        37 :  "Slightly disagree Definitely disagree" ,
        38 :  "Slightly disagree Definitely disagree" ,
        39 :  "Definitely agree Slightly agree" ,
        40 :  "Slightly disagree Definitely disagree" ,
        41 :  "Definitely agree Slightly agree" ,
        42 :  "Definitely agree Slightly agree" ,
        43 :  "Definitely agree Slightly agree" ,
        44 :  "Slightly disagree Definitely disagree" ,
        45 :  "Definitely agree Slightly agree" ,
        46 :  "Definitely agree Slightly agree" ,
        47 :  "Slightly disagree Definitely disagree" ,
        48 :  "Slightly disagree Definitely disagree" ,
        49 :  "Slightly disagree Definitely disagree" ,
        50 :  "Slightly disagree Definitely disagree"
      ]
 
//}
