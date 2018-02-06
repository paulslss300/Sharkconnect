//
//  Club.swift
//  IDK
//
//  Created by Student on 2018-01-23.
//  Copyright © 2018 No Clue. All rights reserved.
//

import Foundation



struct Post {
    var postTi: String
    var postDe: String
    var clubIdentifier: String
    static var posts = [Post]()
    
    init(postTi: String, postDe: String, clubIdentifier: String) {
        self.postTi = postTi
        self.postDe = postDe
        self.clubIdentifier = clubIdentifier
    }
    
}
