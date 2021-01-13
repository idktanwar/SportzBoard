//
//  DetailTableCell.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 13/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import UIKit

class DetailTableCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblStyle: UILabel!
    @IBOutlet weak var lblStrikerate: UILabel!
    @IBOutlet weak var lblRuns: UILabel!
    
    @IBOutlet weak var lblBowlingStyle: UILabel!
    @IBOutlet weak var lblBowlingRate: UILabel!
    @IBOutlet weak var lblBowlingWickets: UILabel!
    @IBOutlet weak var battingview: UIView!
    @IBOutlet weak var bowlingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        battingview.layer.cornerRadius = 8
        bowlingView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(_ player: Player) {
        let batting = player.batting
        let bowling = player.bowling
        
        lblPlayerName.text = player.nameFull
        lblStyle.text = "\(batting.style)"
        lblStrikerate.text = batting.strikerate
        lblRuns.text = batting.runs
        
        lblBowlingStyle.text = "\(bowling.style)"
        lblBowlingRate.text = "\(bowling.economyrate)"
        lblBowlingWickets.text = "\(bowling.wickets)"

    }
}
