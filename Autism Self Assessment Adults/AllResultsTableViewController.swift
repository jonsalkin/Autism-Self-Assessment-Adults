//
//  AllResultsViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/23/23.
//

import UIKit

class AllResultsTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var resultsSegmentedControl: UISegmentedControl!
    
    //MARK: - Properties
    
    struct PropertyKeys {
        static let surveyCell = "SurveyCell"
    }
    
    var surveyResults: [AutismQuotientResponses] = []
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell with the identifier "ResultCell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
    }
    
    
    //MARK: - IBActions
    @IBAction func resultsSegmentedAction(_ sender: UISegmentedControl) {
    }
    
    @IBAction func unwindToAllResultsTableViewController(_ segue: UIStoryboardSegue) {
        guard
            let aqResultsViewController = segue.source as? AQResultsViewController,
            let surveyResult = aqResultsViewController.aqSurveyResult
        else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            surveyResults[selectedIndexPath.row] = surveyResult
        } else {
            surveyResults.append(surveyResult)
        }
    }
        
        //MARK: - Instance Methods
        
        
        
        // MARK: - Table view data source
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autismQuotientResponses.resultsDictionaryAQ.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.surveyCell, for: indexPath)
        
        let sortedKeys = autismQuotientResponses.resultsDictionaryAQ.keys.sorted(by: >)
        let date = sortedKeys[indexPath.row]
        let score = autismQuotientResponses.resultsDictionaryAQ[date] ?? 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: date)
        
        cell.textLabel?.text = "\(formattedDate)    AQ Score: \(score) of 50"
        return cell
    }
        
}

