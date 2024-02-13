//
//  Board.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

struct Board {
    typealias Identifier = String
    var id: Identifier = ""
    var writer: Member?
    var title: String
    var content: String
    var semesterPermission: [Semester]
    var hostType: HostType?
    var boardType: BoardType?
    
    

}

extension Board {
}
