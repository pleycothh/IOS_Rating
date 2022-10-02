//
//  ContentView.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//
//
//  ContentView.swift
//  JSONSerialisation
//
//  Created by Tia on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var eateriess: ViewModel
  //  @ObservedObject var eatery: DetailViewModel

    var body: some View {
        NavigationView {
            VStack{
                MasterView(eateriess: eateriess)
                    .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                        print("this is add element")
                        eateriess.addElement()
                        //TheEateriesApp.save() //<- do not need save here. why?
                        
                    }, label: {
                        Image(systemName: "plus")
                    }))
            }
        }
    }
}





//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(eateriess: ViewModel())
//    }
//}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(eateriess: Binding(get: {
//            TheEateriesApp.model
//        }, set: { newValue in
//            TheEateriesApp.model = newValue
//        }))
//    }
//}
