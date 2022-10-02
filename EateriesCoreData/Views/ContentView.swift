//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI
import CoreData

/// Fetch the Restaurant and sort by name
/// Content View is for the navigation button over the Master view
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Inn.name, ascending: true)],
        animation: .default)
    private var inn: FetchedResults<Inn>


    var body: some View {
        NavigationView {
            MasterView(inn: inn.first ?? Inn(context: viewContext))
                .navigationBarItems(leading: EditButton()
                                    , trailing: Button(action: {
                    withAnimation{
                        if inn.first?.restaurantsArray.count == 0 {
                            print("Empty")
                            inn.first?.addExample()
                        }else{
                            print("Not Empty")
                            inn.first?.addItem()
                        }
                        
                    }}){
                Label("", systemImage: "plus" )
            })
        }
    }
}
