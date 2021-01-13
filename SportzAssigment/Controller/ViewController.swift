//
//  ViewController.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var tblView: UITableView!
    private var matchVM = MatchDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMatchData()
    }
    
    //MARK: Methods
    func setupUI() {
        self.view.backgroundColor = .systemBlue
        tblView.delegate = self
        tblView.rowHeight = UITableView.automaticDimension
        tblView.separatorColor = .clear
        tblView.backgroundColor = .systemBlue
    }
    
    func fetchMatchData() {
//        matchViewModel.fetchAllMatchData { [weak self] in
//            DispatchQueue.main.async {
//                self?.tblView.dataSource = self
//                self?.tblView.reloadData()
//            }
//        }
        
        WebService().getMatchData { [weak self] (result) in
            
            switch result {
                case .success(let match):
                    self?.matchVM.addMatchViewModel(match)
                    DispatchQueue.main.async {
                        self?.tblView.dataSource = self
                        self?.tblView.reloadData()
                }
                case .failure(let error):
                    // Something is wrong with the JSON
                    print("Error processing json data: \(error)")
            }
        }
    }

}

extension ViewController: UITableViewDelegate,  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchVM.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchlistcell", for: indexPath) as! MatchListTableCell
        let matchData = matchVM.modelAt(indexPath.row)
        cell.configureCell(match: matchData)
        cell.selectionStyle = .none
        cell.updateConstraintsIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}
