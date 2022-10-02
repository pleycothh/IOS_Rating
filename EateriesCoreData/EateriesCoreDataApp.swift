//
//  EateriesCoreDataApp.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI

@main
struct EateriesCoreDataApp: App {

    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
