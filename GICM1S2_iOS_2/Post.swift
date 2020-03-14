//
//  Post.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/14/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import Foundation
class Post: Codable {
    let userID, id: Int
    let title, message: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
        case message = "body"
    }

    init(userID: Int, id: Int, title: String, msg: String) {
        self.userID = userID
        self.id = id
        self.title = title
        self.message = msg
    }
}
