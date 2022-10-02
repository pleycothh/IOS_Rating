//
//  TheEateriesApp.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

import SwiftUI

//@main
struct TheEateriesApp: App {
    

 
    static var model: [Eateries] = {
        guard let data = try? Data (contentsOf: TheEateriesApp.fileURL) ,
              let model = try? JSONDecoder().decode([Eateries].self, from: data) else {
            return [defult]
        }
        return model
    }()
    
    ///
    ///Some thing wrong here, it always load init data, neeed to read Json data,
    ///the Json data write fine, just can not read
    
    /*
    this code creat init data for entire App
    make a model a array , wouden't be able to change
    static is key to not show: Instance member 'model' cannot be used on type 'JSONSerialisationApp'
    --------------------------------------------------------------------------------------------------*/

    
    
    var masterViewModel: ViewModel = { //< ={}() will make it class not getter
        let eateriess = TheEateriesApp.model
        let viewModel = EateriesCoreData.ViewModel(model: eateriess)
        viewModel.model = eateriess
        return viewModel
    }()

    
//     This code create the viewmodel (outside the view) for the entire app
//     --------------------------------------------------------------------------------------------------*/


    
    var body: some Scene {
        WindowGroup {
           // ContentView(eateriess: masterViewModel) //<- afte r labe 1
        }
    }

    /*
     content view
     --------------------------------------------------------------------------------------------------*/
    
    
    static var fileURL: URL {
        let fileName = "eateries.json"
        let fm = FileManager.default ///<-------------add file manager
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return URL(fileURLWithPath: "/")
            
        }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    /*
     This code above create a fileURL variable
     --------------------------------------------------------------------------------------------------*/
    
    
    
    static func save(model: [Eateries]) {
        do {
            let data = try JSONEncoder().encode(model) /// <--------------- encode data as JSON
            try data.write(to: fileURL, options: Data.WritingOptions.atomic) ///<- write data to fileURL wiht atomic option
            
            guard let dataString = String(data: data, encoding: .utf8) else {
                return ///<---------priovide defualt value
            }
            print(dataString)
        }catch{
            print("could note write file \(error)") ///<---------------------- error handling
        }
    }
}
    /*
    This code above save the input data to json file eachtime run save() fucntion
 --------------------------------------------------------------------------------------------------*/
