//
//  DetailViewModel.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

///
///edit  function on delete page
///

//
//import Foundation
//import SwiftUI
//import UIKit

//<- for getting the value

//
//class DetailViewModel: ObservableObject {
//    @Published var eatery: Eateries
//
//    init(eatery: Eateries) {
//        self.eatery = eatery
//    }
//}
//    var image: Image{ //<- need to use .self for wach name //<- this is variable, I need a function
//        let emptyImage = Image("nonexistent")
//        guard let url = (URL(string: \.self)) else {
//            return emptyImage // return emplty image
//        }
//        // ...download Image
//        guard let data = try? Data(contentsOf: url) else {
//            return emptyImage
//        }
//        guard  let uiImage = UIImage(data: data) else {
//            return emptyImage
//        }
//        return Image(uiImage: uiImage)
//
//    }
//}

/*

task list:

 - complete basice formation check
 
 - input defult data check
 
 - add environment check
 
 - add edit function based on envrionment
    - edit title check
    - edit detail view
 
 - load image from url check
 
 - load data form Json,file
 
 - add move and delete function bansed on MVVM
 
 
 
 */
