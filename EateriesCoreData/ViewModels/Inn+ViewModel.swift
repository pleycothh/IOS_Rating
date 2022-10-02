//
//  Inns+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import Foundation
import CoreData


extension Inn {
    
    /// Non-optional string used as title
    var titleString: String {
        get{ name ?? "Title"}
        set{ name = newValue}
    }

    /// View Model computed property that returnes  restaurant as Array
    var restaurantsArray: [Restaurant] {
        get{ restaurants?.array as? [Restaurant] ?? []}
        set{ restaurants = NSOrderedSet(array: newValue)}
        // convert NSOrdered Set from NSSet?
        // 1:04:11
    }
    

    
    /// return managed Object Context, and create one if nil
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    
    /// add new restaurant element to restaurant array
    func addItem() {
        let newRestaurant = Restaurant(context: viewContext)
        newRestaurant.name = "Restaurant"
        newRestaurant.image = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAbFBMVEX///9NTU1HR0c+Pj7R0dHa2tqEhIQ7OztERESpqanr6+vi4uKlpaU2NjZKSkpCQkKNjY2VlZV4eHhVVVXx8fFZWVn39/d6enrJyclwcHC/v79qamqJiYmgoKDFxcXOzs4vLy8mJiazs7NgYGCKUUrWAAAE90lEQVR4nO2d62KiMBBGY1CDF0DrtbW2Xfv+77jIditqAknMDKT9zm9IOQ4DM0BSIQAAAAAAAAAAAAAAAAAAAADgYTsa9pvR9iG/0VOmkn6j1G7kL3jM5KD/yOzoK7hIuj54S9TST/BFdX3k1mR7L8NB3vWBW5NvfAT3sZyjZ9TQw3CZdn3YDqQTD8PXGK6j/5ELD8NxVIZjGMKw78CwR4Yqu+Bwu4rHUK1rRzCxV4zIcFo7gjkML8AQhnzA0AQMYcgHDE3AEIZ8wNAEDGHIBwxNwBCGfMDQRP8M81TPR93wqAxbRWCYP0/0zOvfjgzn+o1O94q9M0w9Py34IoMhDGEIQxjCEIYwhCGHoXydzvTUj2Bt2GZ6/1lo7wwHUun5c9VbfBi20ozXO0MTP6c/NAFDEzCEIR8wNAFDGPIBQxMwhCEf8Rj6TnuLxDAvsk2SeEnGYShXb+Xuw0PhsW8Uhvnm6w3Zq4diFIbye8rE2H0GYwyGxekyxMo5F2MwlLUhZs4TbSMwrIfQYzp4/w3zwfUgC8erTf/nPV2HsOTTLRXleHHhYL8vm+FtCIWYOgZR1nD4cdgMk5e7YfYsKzNwGeYrzThLn9rGFS5DTQhLDgxNCpOhNoRCbBmCyGSoD2FZhNOnIo+hIYQlc/JFRHgMTSEseaZORRbDpjVittRr3bAYNoRQiNH9q/egcBias7DiRJuKHIaNIRRe7bADDIbtKzW5t8MOMBgmb23jzSjvivSGLVlYQbk6Gr1hewhLFnSpSG6Yf1oNuSFLRXLDxG7NO9d2uD+G1kve7alu/NSGliEUdO0wsaFlFlYQtcPEhsph5cl1SnK1oTV0CSFVO0xraJ+FFSTtMKmhWwgFTTtMaqjeHQfe5uFTkdIwPziPPGpPRdffgNLQOYSitR1OVbKRWeFiSWjoEcKSXUMNLtP5+RXb9jRwyFdCQ68FfJva4fTwPVF2Z18A0Rn6hbChHS529UOwbrfoDD1DaGyHi6errazbLTJD3xCWvOrik14L2j/5IDP0DqHQxudWUIiJZQFEZZg/+wuK6d3Bp5rhLAsgKkP1wP9dEOLt5hTUCYq1XRCJDB/IworrdjjVj2b3hI7I8LEQiut22CBoecugMXwoCyu2q++/UZjPB5tvMmgMHw5hqfisqr8is4ZJpTY9M4mhfDiEZ96f0qKQ41nTNhaPr0gMA4TwH+t12xbtpQ2FYZgQ2tFe2lAYBguhDa2lDYGhvCuwSGkrbQgMWUPYXtqEN2QO4X2JR26oGi/vFDSXNsEN5a59/9A0PoMMbpixh7CltAlt2EUIm0ub0Ib8WVjRUNoENuwmhI2lTWDDLrKwwvysPKxhVyEUDW+Qwxp2lIVn1qabYlBDr8FCYXpqE9Qwm7bvS4ehtAlp2GkIhek/a4Y07DALK/SlTUDDrkNoKG0CGnYdQqEvbcIZ2nxHSs275r4f0JC789WheYEczrDDeuaC5sh+1llKa+j6iRcJmltiyPthyvuQTYPuc/GgVZs6zrbte1Oxfvkkvh+eo5jQfCNqg0z0n0rFswKPLzCEYf+BIQz7Dwx/qeEiKsOFh+GRdGpyYNKjhyHDahbh8PvQlXTydVisJ0BeQzYdMjyZx6SPM8tYzlPlk4UVkyyG66nMbhcYc2A2TlTSb1SxePBV0WzUb7p/Bg8AAAAAAAAAAAAAAAAAAAB+DX8BTPSMRzOpIHMAAAAASUVORK5CYII="
        newRestaurant.note = "Note"
        
        /// add  new Restaurant to NSOrderset restaurant array under Inn Entity by using Core Data Properties
        addToRestaurants(newRestaurant)
        
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
        offsets.map { restaurantsArray[$0]}.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    
    func addExample() {
        let firstERestaurant = Restaurant(context: viewContext)
        let secondERestaurant = Restaurant(context: viewContext)
        let thirdERestaurant = Restaurant(context: viewContext)
        let fourthERestaurant = Restaurant(context: viewContext)

        
        firstERestaurant.name = "Tripadvisor"
        firstERestaurant.note = "About Tripadvisor Tripadvisor, the world's largest travel guidance platform*, helps hundreds of millions of people each month** become better travelers, from planning to booking to taking a trip. Travelers across the globe use the Tripadvisor site and app to discover where to stay, what to do and where to eat based on guidance from those who have been there before."
        firstERestaurant.image = "https://media-cdn.tripadvisor.com/media/photo-s/16/56/3b/c9/local-cafes-and-eateries.jpg"
        firstERestaurant.locationName = "Brisbane"
        firstERestaurant.locationLatitudeString = "-27.470125"
        firstERestaurant.locationLongitudeString = "153.021072"

        
        secondERestaurant.name = "Eco Warrior Princess"
        secondERestaurant.note = "Founded in 2010 by Jennifer Nini a writer, activist and certified organic farm owner, Eco Warrior Princess covers the topics that matter — environmental issues, conservation, sustainable fashion, conscious business, social justice, politics, feminism, eco beauty, wellness, green technology — in an analytical, intelligent and honest way – without any of the BS."
        secondERestaurant.image = "https://ecowarriorprincess.net/wp-content/uploads/2019/09/8-Ethical-Eateries-in-Sydney-for-Sunday-Brunch.jpeg"
        secondERestaurant.locationName = "Glen Echo"
        secondERestaurant.locationLatitudeString = "-25.897383223428548"
        secondERestaurant.locationLongitudeString = "152.37082498765773"
        
        thirdERestaurant.name = "Tripadvisor"
        thirdERestaurant.note = "Very good place to eat in Paris"
        thirdERestaurant.image = "https://cdn.trendhunterstatic.com/phpthumbnails/148/148264/148264_1_600.jpeg"
        thirdERestaurant.locationName = "Paris"
        thirdERestaurant.locationLatitudeString = "48.864716"
        thirdERestaurant.locationLongitudeString = "2.349014"
        
        fourthERestaurant.name = "Hidden City"
        fourthERestaurant.note = "The Top Bars in London by Hidden City Secrets"
        fourthERestaurant.image = "https://www.hiddencitysecrets.com.au/wp-content/uploads/2021/03/natural-history-public-restaurant-dining-restaurants-pubs-pub-diner-diners-eateries-eatery-melbourne-cbd-15.jpg"
        fourthERestaurant.locationName = "London"
        fourthERestaurant.locationLatitudeString = "51.509865"
        fourthERestaurant.locationLongitudeString = "-0.118092"
       

        addToRestaurants(firstERestaurant)
        addToRestaurants(secondERestaurant)
        addToRestaurants(thirdERestaurant)
        addToRestaurants(fourthERestaurant)

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
