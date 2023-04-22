//
//  ResultsViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/11/23.
//

import UIKit
import SwiftUI
import Charts

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

            
    //MARK: - IBOutlets
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet weak var resultsExitButton: UIButton!
    @IBOutlet var barChartView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var tableView: UITableView!
    
    
    //MARK: - Properties

    var sortedDates: [Date] = []

    
    
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        showResults()
        print(totalScore)
        
        // populate resultsDictionary here
        sortedDates = resultsDictionary.keys.sorted()
        
        // Set the table view's data source and delegate to this view controller
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set the content size of the scroll view to fit the table view
        scrollView.contentSize = tableView.contentSize
        
        // Register the table view cell with the identifier "ResultCell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if resultsDictionary.count > 0 {
            addBarChart()
            tableView.reloadData()
            
           }
    }
    
    
    
    
    //MARK: - IBActions
    @IBAction func unwindToWelcome(unwindSegue: UIStoryboardSegue) {
    }
    
    
    
    //MARK: - Instance Methods
    
    func showResults() {
        if totalScore == 0 && resultsDictionary.isEmpty {
//                        resultsLabel.text = "This is the Results page."
            resultsLabel.isHidden = true
            
//            resultsExitButton.isHidden = true
        } else {
            addToResultDictionary(from: totalScore)
            print("Date: Score: \(resultsDictionary)")
            addBarChart()
        }
    }
    
    // After each completed assessment, a historical entry is added to the dictionary, resultsDictionary.
    func addToResultDictionary(from totalScore: Int) {
        // Add the survey result to the dictionary with the current date
        resultsDictionary[Date()] = totalScore
    }
    
    
    //MARK: - Bar Chart
    // Input data from the survey to display on chart below.
    struct AutismData: Identifiable {
        var demographic: String
        var answerCount: Int
        var id = UUID()
    }
    
    // Complete Bar Chart Creation to compare user survey data
    struct BarChart: View {
        
        // Initializing each bar in the chart
        var autismData: [AutismData] = [
            .init(demographic: "Non-A Males", answerCount: 17),
            .init(demographic: "Non-A Females", answerCount: 15),
            .init(demographic: "79.3% Aut.", answerCount: 32),
            .init(demographic: "You", answerCount: totalScore)
        ]
        
        // Vertical Stack of Chart
        var body: some View {
            
            VStack {
                Text("Adult Autism Spectrum Quotient (AQ)")
                    .fontWeight(.bold)
                Chart {
                    ForEach(autismData) { datum in
                        BarMark(
                            x: .value("demographic", datum.demographic),
                            y: .value("answer count", datum.answerCount)
                        )
                        .foregroundStyle(Color.pink.gradient)
                        .cornerRadius(3)
                    }
                    RuleMark(y: .value("May Indicate Autism", 26))
                        .foregroundStyle(Color.mint)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading) {
                            Text(" Possible Autism > 26")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                }
                .frame(height: 180)
                .chartYScale(domain: 0...50)
                Text("\n\nScoring Range: 0-50\nThreshold score: > 26\n\nScores 26 or greater indicate you might be autistic\nLower scores mean you likely are not\n\n79.3% of autistic people score 32 or higher\nMost non-autistic females score 15 on average\nMost non-autistic males score 17 on average")
                    .fontWeight(.semibold)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
//            .padding()
        }
    }
    
    
    func addBarChart() {
        resultsLabel.text = "Your Score: \(totalScore)"
        if #available(iOS 16, *) {
            let barChart = BarChart()
            let hostingViewController = UIHostingController(rootView: barChart)
            
            addChild(hostingViewController)
            barChartView.addSubview(hostingViewController.view)
            hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                hostingViewController.view.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor),
                hostingViewController.view.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor),
                hostingViewController.view.topAnchor.constraint(equalTo: barChartView.topAnchor),
                hostingViewController.view.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor)
            ])
        }
    }
    
    
    //MARK: - Table and Scroll View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Add the table view as a subview of the scroll view
        scrollView.addSubview(tableView)

        // Set up constraints to position the table view within the scroll view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Calculate the total height of the table view content
        let totalHeight = tableView.contentSize.height

        // Set the content size of the scroll view to allow scrolling in both directions
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: totalHeight)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let sortedKeys = resultsDictionary.keys.sorted(by: >)
        let date = sortedKeys[indexPath.row]
        let score = resultsDictionary[date] ?? 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: date)
        
        cell.textLabel?.text = "\(formattedDate)       Score: \(score) of 50"
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        if indexPath.row < sortedDates.count {
//            let selectedDate = sortedDates[indexPath.row]
//            let surveyResult = resultsDictionary[selectedDate]
//            // Use the selectedDate to access the corresponding result from the dictionary
//
//            if let surveyResult = surveyResult {
//                // Checks if there is a survey result then prints if there is or is not a result.
//                print("Selected survey result: \(surveyResult)")
//            } else {
//                print("No survey result found for selected date")
//            }
//
//        } else {
//            tableView.reloadData()
//        }
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var index = 0
        for (_, surveyResult) in resultsDictionary {
            if index == indexPath.row {
                // Use the selectedDate to access the corresponding result from the dictionary
                print("Selected survey result: \(surveyResult)")
                return
            }
            index += 1
        }
        print("No survey result found for selected date")
    }
    
    // end of ResultsViewController
}


