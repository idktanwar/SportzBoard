//
//  DetailViewController.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 13/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK:Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentMatch: UISegmentedControl!
    var matchVM: MatchData!
    var hometeam = ""
    var awayTeam = ""
    var playerInfoHome = [(String, Player)]()
    var playerInfoAway = [(String, Player)]()

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Methods
    func  setupUI() {
        
        self.navigationItem.title = matchVM.matchdetail.match.number
        
        segmentMatch.setSelectedSegmentForegroundColor(.white, andTintColor: .red)
        
        hometeam = matchVM.matchdetail.teamHome
        awayTeam = matchVM.matchdetail.teamAway
        
        let teamDict: [String: Team] = matchVM.teams
        
        let team1: Team? = teamDict[hometeam]
        let team2: Team? = teamDict[awayTeam]
        
        for (k, v) in team1!.players {
            let temp = (k, v)
            playerInfoHome.append(temp)
        }
        
        for (k, v) in team2!.players {
            let temp = (k, v)
            playerInfoAway.append(temp)
        }
        
        segmentMatch.setTitle(team1?.nameFull, forSegmentAt: 0)
        segmentMatch.setTitle(team2?.nameFull, forSegmentAt: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }

    //MARK: Selectors
    
    @IBAction func SegmentChanged(_ sender: UISegmentedControl) {
        segmentMatch.setSelectedSegmentForegroundColor(.white, andTintColor: .red)
        tableView.reloadData()
    }
    
    func  getSelectedSement() -> Int {
        segmentMatch.selectedSegmentIndex
    }
    
}

extension DetailViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //as of now shwoing only player list of both Team
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let teamDict: [String: Team] = matchVM.teams
        
        if segmentMatch.selectedSegmentIndex == 0 {
            let team: Team? = teamDict[hometeam]
            return team?.players.keys.count ?? 0
        }
        else {
            let team: Team? = teamDict[awayTeam]
            return team?.players.keys.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Players"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath) as! DetailTableCell
                
        if segmentMatch.selectedSegmentIndex == 0 {
            let player = playerInfoHome[indexPath.row]
            cell.textLabel?.text = player.1.nameFull
            return cell
        }
        else {
            let player = playerInfoAway[indexPath.row]
            cell.textLabel?.text = player.1.nameFull
            return cell
        }
        
        
        
    }

}
