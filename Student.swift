//
//  Student.swift
//  IDK
//
//  Created by Student on 2018-02-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import Foundation

struct Student {
    var StudentNa: String
    var StudentPa: String
    static var students = [Student]()
    
    
    init(StudentNa: String, StudentPa: String) {
        self.StudentNa = StudentNa
        self.StudentPa = StudentPa
    }
    
}
