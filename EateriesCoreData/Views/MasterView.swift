//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI

/// Master view shows the list of RowView and link to DetailView
struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var inn: Inn
   // @ObservedObject var title: Title

    
    /// From Inn entity, for each inn, ritch all the restaurant
    var body: some View {
        
            //<- this code is used to set up the init value of inn.name
//            TextField("Enter Note", text: $inn.titleString , onCommit: {
//                try? viewContext.save()
//            }).font(.body.bold())
//


        List {
            if mode?.wrappedValue == .active {
                TextField("Enter title here:", text: $inn.titleString , onCommit: {
                    try? viewContext.save()
                }).font(.largeTitle)
            }
            ForEach(inn.restaurantsArray) { res in
                NavigationLink(
                    destination: DetailView(restaurant: res),
                    label: {
                        RowView(restaurant: res)
                    })
            }
            .onDelete{ offsets in
                withAnimation{ inn.deleteItems(offsets: offsets)}
            }
            .onMove{ (indices, destination) in
                self.inn.restaurantsArray.move(fromOffsets: indices, toOffset: destination)
                try? viewContext.save()
            }
     
        }
        .navigationTitle(mode?.wrappedValue == .active ? "" : inn.titleString)
    }
}



