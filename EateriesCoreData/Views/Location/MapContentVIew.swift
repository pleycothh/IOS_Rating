//
//  MapContentVIew.swift
//  EateriesCoreData
//
//  Created by Ben Li on 25/5/21.
//

import SwiftUI

struct MapContentVIew: View {
    @ObservedObject var locations: Restaurant
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
      
            
        VStack{
            MapView(viewModel:locations)
                .frame(height: 300)
                .padding(.top, -50)
            
            List{
                Section (header: Text("Location")
                            .font(.title)
                            .fontWeight(.heavy)){

                    LazyTextField(prompt:"Enter Location here:", text: $locations.locationNameString, onCommit : {
                        locations.lookupPosition()
                        print("look up position")
                        try? viewContext.save()
                    })
                       
                

                    LazyTextField(prompt:"Enter Latitude here:", text: $locations.locationLatitudeString, onCommit : {
                        locations.lookupName()
                        try? viewContext.save()
                    })
                    // create make data is string in between? -> MVVM


                    LazyTextField(prompt:"Enter Longitude here:", text: $locations.locationLongitudeString, onCommit : {
                        locations.lookupName()
                        try? viewContext.save()
                    })
                }
            }
          
        }
    }
}
