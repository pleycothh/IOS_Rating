//
//  Restaurants+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

extension Restaurant {
    /// Non_optional property string
    var nameString: String {
        get{ name ?? ""}
        set{ name = newValue}
    }
    var imageString: String {
        get{ image ?? ""}
        set{ image = newValue}
    }

    var noteString: String {
        get{ note ?? ""}
        set{ note = newValue}
    }

    
    /// View Model computed property that returnes  restaurant as Array
    var reportsArray: [Report] {
        get{ reports?.array as? [Report] ?? []}
        set{ reports = NSOrderedSet(array: newValue)}
        // convert NSOrdered Set from NSSet?
        // 1:04:11
        
    }
    
    /// unwrape location
//    var locationItem: Location {
//        get {
//            if let loc = locations {
//                return loc
//            }
//            // Create a new location
//            let newLocation = Location(context: viewContext)
//            locations = newLocation
//            do {
//                try viewContext.save()
//                return newLocation
//            } catch let e {
//                print(e)
//                fatalError(e.localizedDescription)
//            }
//        }
//        set { locations = newValue}
//    }
    
    /// return managed Object Context, and create one if nil
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    
    /// add new restaurant element to restaurant array
    func addItem() {
        let newReport = Report(context: viewContext)
        newReport.reportAuthor = "Author"
        newReport.reportContent = "Content"

        /// add  new Restaurant to NSOrderset restaurant array under Inn Entity by using Core Data Properties
        addToReports(newReport)
        //newRestaurant.inns = self // <- same as above

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    /// remove selected  restaurant from restaurant array
    /// - Parameter offsets: select index set
    func deleteItems(offsets: IndexSet) {
        offsets.map { reportsArray[$0]}.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    /// dowloand Image from URL
    /// - Parameter image: string of image URL
    /// - Returns:  Image
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
