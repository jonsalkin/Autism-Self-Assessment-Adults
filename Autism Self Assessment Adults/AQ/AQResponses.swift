//
//  AQResponses.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 3/28/23.
//

import Foundation

// Array of responses to all 50 Autism Quotient questions in the active, current survey being completed by the user. This will be emptied after each completed
// survey, so when the user starts a new survey, the array is empty.
var currentResponsesAQ = [String]()

var totalScoreAQ = Int()

// After completing each assessment, the result is entered
// into  resultsDictionary with Date as key, and totalScore as Int value.
// These results persist after every survey is completed, so a user can
// look back at other previously completed surveys.
var resultsDictionaryAQ: [Date: Int] = [:]
