//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI

/// shows the every information.
struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurant: Restaurant
  

    
    /// From Inn entity, for each inn, ritch all the restaurant
    var body: some View {
        VStack {
//<---------------------------------------------Image Section: -----------------------------------------------------------
           
            if editMode?.wrappedValue == .active {
              
                TextField("Enter ImageURL", text: $restaurant.imageString , onCommit: {
                    try? viewContext.save()
                    }).font(.subheadline)
                
            } else {
                Image(uiImage: restaurant.load(image: restaurant.imageString))
                    .resizable()
            }
            //
           

            List {
//<---------------------------------------------Name Section: -----------------------------------------------------------

                if editMode?.wrappedValue == .active {
                    TextField("Enter Name", text: $restaurant.nameString , onCommit: {
                        try? viewContext.save()
                        }).font(.title)
                }
                Section (header: Text(editMode?.wrappedValue == .active ? "" : restaurant.nameString)
                            .font(.title)
                            .fontWeight(.heavy)){
//<---------------------------------------------Place Section: -----------------------------------------------------------


                    NavigationLink(
                        destination: MapContentVIew(locations: restaurant),
                        label: {
                            Text(restaurant.locationNameString)
                        })
                }
                
 
//<---------------------------------------------Note Section: -----------------------------------------------------------
                

                Section (header: Text("Note")
                            .font(.title)
                            .fontWeight(.heavy)){

                    if editMode?.wrappedValue == .active {
                        TextEditor(text: $restaurant.noteString)
                            .foregroundColor(Color.black)
                            .font(.custom("HelveticaNeue", size: 13))
                            .lineSpacing(5)
                            .onDisappear(perform: {
                                try? viewContext.save()
                            })
                    }
                    Text(editMode?.wrappedValue == .active ? "" : restaurant.noteString)
                    

                }

//<-----------------------------------------------Review Section: -----------------------------------------------------
               
                Section (header: Text("Review")
                            .font(.title)
                            .fontWeight(.heavy)) {
                    ForEach(restaurant.reportsArray) { rep in
                        ReportRowView(report: rep)
        //                NavigationLink(
        //                    destination: ReportView(report: rep),
        //                    label: {
        //                        ReportRowView(report: rpo)
        //                    })
                    }
                    .onDelete{ offsets in
                        withAnimation{ restaurant.deleteItems(offsets: offsets)}
                    }
                    .onMove{ (indices, destination) in
                        self.restaurant.reportsArray.move(fromOffsets: indices, toOffset: destination)
                        try? viewContext.save()
                    }
                }
            }.navigationBarItems(leading: EditButton(), trailing:  Button(action: {
                withAnimation{
                    restaurant.addItem()
                }}) {
                Label("add review", systemImage: "plus")
            })
            
         
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

