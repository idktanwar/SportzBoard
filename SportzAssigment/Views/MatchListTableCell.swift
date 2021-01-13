//
//  MatchListTableCell.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import UIKit

protocol ShowButtonDidSelect {
    func showTheMatchDetail(atIndex: Int)
}

class MatchListTableCell: UITableViewCell {

    //MARK:Properties
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTeam1: UILabel!
    @IBOutlet weak var lblTeam2: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnShowMatch: UIButton!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblMatchTitle: UILabel!
    @IBOutlet weak var lblTeam1Runs: UILabel!
    @IBOutlet weak var lblTeam2Runs: UILabel!
    @IBOutlet weak var lblTeam1Overs: UILabel!
    @IBOutlet weak var lblTeam2Overs: UILabel!
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.backgroundColor = .systemBlue
        mainView.backgroundColor = .white
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.4
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowRadius = 3
        mainView.layer.cornerRadius = 8.0
        
        let title = "Show Match"
        
        //or whatever font you're using
        btnShowMatch.setTitle(title, for: .normal)
        btnShowMatch.layer.cornerRadius = 6.0
        btnShowMatch.sizeToFit()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(match: MatchData) {

        self.lblResult.text = match.matchdetail.result
        //fist data showing for home team & second data in cell is for away team
        let teamHome = match.matchdetail.teamHome
        let teamAway = match.matchdetail.teamAway
        
        let match1 = match.matchdetail.match
        self.lblDateTime.text = Utils.app.convertDateFormater(match1.date) + " | \(match1.time)"
        self.lblMatchTitle.text = match1.number
        
        let teamDict: [String: Team] = match.teams        
        let team1 = teamDict[teamHome]
        let team2 = teamDict[teamAway]
        lblTeam1.text = team1?.nameShort
        lblTeam2.text = team2?.nameShort
        
        let innings = match.innings
        for inning in innings {
            if inning.battingteam == teamHome {
                lblTeam1Runs.text = "\(inning.total)/\(inning.wickets)"
                lblTeam1Overs.text = "\(inning.overs)"
            }
            
            if inning.battingteam == teamAway {
                lblTeam2Runs.text = "\(inning.total)/\(inning.wickets)"
                lblTeam2Overs.text = "\(inning.overs)"

            }
        }
    }

    //MARK:Actions
    @IBAction func showMatchClicked(_ sender: Any) {
        
    }
}
