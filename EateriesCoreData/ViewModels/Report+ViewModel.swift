//
//  Reviews+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import Foundation
import CoreData

extension Report {

    /// Non_optional property string
    var reportAuthorString: String {
        get{ reportAuthor ?? ""}
        set{ reportAuthor = newValue}
    }
    
    /// Non-optional property string
    var reportContentStringnt: String {
        get{ reportContent ?? ""}
        set{ reportContent = newValue}
    }
}
