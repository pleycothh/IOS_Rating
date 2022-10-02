//
//  DetailView.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var eatery: Eateries
    @ObservedObject var eateryViewModel: ViewModel //<- why use []
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack {
            if editMode?.wrappedValue == .active {
              
                    TextField("Enter ImageURL", text: $eatery.image , onCommit: {
                        TheEateriesApp.save(model: eateryViewModel.model)
                    }).font(.subheadline)
                
            } else {
                Image( uiImage: eateryViewModel.load(image: eatery.image))
                    .resizable()
            }
            
            
            VStack{
                List{
//<---------------------------------Name & Place:
                    if editMode?.wrappedValue == .active {
                        
                        TextField("Enter Name", text: $eatery.name , onCommit: {
                            TheEateriesApp.save(model: eateryViewModel.model)
                        }).font(.title)
                        
                    }

                    Section (header: Text(editMode?.wrappedValue == .active ? "" : eatery.name)
                                .font(.title)){
                        

                        if editMode?.wrappedValue == .active {
                            
                            TextField("Enter Place", text: $eatery.place , onCommit: {
                                TheEateriesApp.save(model: eateryViewModel.model)
                            }).font(.body)
                            
                        }
                        Text(editMode?.wrappedValue == .active ? "" : eatery.place)
                    }
//<---------------------------------Note:
                    Section (header: Text(editMode?.wrappedValue == .active ? "Note" : "Note")
                                .font(.title)){

                        if editMode?.wrappedValue == .active {
                            
                            TextField("Enter Note", text: $eatery.note , onCommit: {
                                TheEateriesApp.save(model: eateryViewModel.model)
                            }).font(.body)
                            
                        }
                        Text(editMode?.wrappedValue == .active ? "" : eatery.note)
                    }
                
//<---------------------------------Reviews:
                 
                    Section(header: Text("Review" )
                        .font(.title)
                    ){
                        ReviewView(review: eatery, eateryViewModel: eateryViewModel)
                    }
                }
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(eatery: [Eateries], eateryViewModel: ViewModel(model: Eateries))
//    }
//}

