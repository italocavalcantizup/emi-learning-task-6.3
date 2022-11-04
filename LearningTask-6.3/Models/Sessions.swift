//
//  Sessions.swift
//  LearningTask-6.3
//
//  Created by Italo cavalcanti on 04/11/22.
//

import Foundation

struct Sessions {
    var commingSessions: [Session]
    var by: Cinema
    
    init(_ commingSessions: [Session], by: Cinema) {
        self.commingSessions = commingSessions
        self.by = by
    }
}
