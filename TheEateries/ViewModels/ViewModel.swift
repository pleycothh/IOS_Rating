//
//  MasterViewModel.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

///
/// show all delete, move, edit on master view
///

import Foundation
import UIKit
import SwiftUI

//<- for the function

class ViewModel: ObservableObject {
    @Published var model: [Eateries] //<- call the same thing, so I can get the same name.

    init(model: [Eateries]) {
        self.model = model
    }
    
    
    func addElement () {
        let eateriesNumber = model.count + 1
        let eateriess = Eateries (name: "Eateries, \(eateriesNumber)", place: "New Place", note: "New note", image: " New URL", title: "Eateries", reviews: [Review(revName: "review name", revNote: "review note")])
        model.append(eateriess)
    }
    func addReviews (at review: [String]) {
        let reviewNumber = model
        let newReview = Review(revName: "new review", revNote: "new note")
        
     //   let reviewNumber = model
    }
    
    
    func remove( at indices: IndexSet) {
        model.remove(atOffsets: indices)
    }

    
    func load(image:String)->UIImage {
        //try catch block
        do{
            // load URL string into url
            guard let url = URL(string: image) else {
                //return eampty image if url ivilade
                return UIImage()
            }
            
            //convert URL to data
            let data: Data = try Data(contentsOf: url)
            
            //creat Image object from data
            return UIImage(data:data) ?? UIImage()
        }catch {
            //
        }
        return UIImage()
    }
    
    
}

