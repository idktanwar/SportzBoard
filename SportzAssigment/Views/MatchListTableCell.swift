//
//  MatchListTableCell.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import UIKit

class MatchListTableCell: UITableViewCell {

    //MARK:Properties
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgTeam1: UIImageView!
    @IBOutlet weak var imgTeam2: UIImageView!
    @IBOutlet weak var lblTeam1: UILabel!
    @IBOutlet weak var lblTeam2: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnShowMatch: UIButton!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblMatchTitle: UILabel!
    
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(match: MatchData) {
        self.imgTeam1.image = UIImage(named: "team1")
        self.imgTeam2.image = UIImage(named: "team2")
        
        self.lblResult.text = match.matchdetail.result
        
        let match = match.matchdetail.match
        self.lblDateTime.text = Utils.app.convertDateFormater(match.date) + " | \(match.time)"
    }

    //MARK:Actions
    @IBAction func showMatchClicked(_ sender: Any) {
        
    }
}
