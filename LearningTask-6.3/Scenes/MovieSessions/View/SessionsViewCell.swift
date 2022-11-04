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
    
    func setup(_ session: Session) {
        horarioSessionLabel.text = DateFormatter.format(date: session.dateTime, to: .hoursPlusMinutes)
        tipoSessionLabel.text = session.type.tipo
    }
    
}
