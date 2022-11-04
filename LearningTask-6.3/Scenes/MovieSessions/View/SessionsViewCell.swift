//
//  MovieSessionsViewCell.swift
//  LearningTask-6.3
//
//  Created by Italo cavalcanti on 04/11/22.
//

import UIKit

class SessionsViewCell: UITableViewCell {

    @IBOutlet weak var horarioSessionLabel: UILabel!
    @IBOutlet weak var tipoSessionLabel: UILabel!
    
    func setup() {
        horarioSessionLabel.text = "18:15"
        tipoSessionLabel.text = "Legendado"
    }
    
}
