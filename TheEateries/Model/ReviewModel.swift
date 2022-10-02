//
//  ReviewModel.swift
//  TheEateries
//
//  Created by Tia on 11/5/21.
//

import Foundation





class Review: ObservableObject, Identifiable, Decodable, Encodable {

    var revName: String
    var revNote: String

    init(revName: String, revNote: String){
        self.revName = revName
        self.revNote = revNote
       }
    }

