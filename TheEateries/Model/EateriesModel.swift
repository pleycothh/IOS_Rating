//
//  EateriesModel.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

import Foundation





class Eateries: ObservableObject, Identifiable, Decodable, Encodable {

    var name: String
    var place: String
    var note: String
    var image: String
    var title: String
    var reviews: [Review]
    

    init(name: String, place: String, note: String, image: String, title: String, reviews: [Review]) {
        self.name = name
        self.place = place
        self.note = note
        self.image = image
        self.title = title
        self.reviews = reviews
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name, place, note, image, title, reviews
    }

    required init (from decoder:Decoder ) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        place = try container.decode(String.self, forKey: .place)
        note = try container.decode(String.self, forKey: .note)
        image = try container.decode(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        reviews = try container.decode([Review].self, forKey: .reviews)

    }
    
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(place, forKey: .place)
        try container.encode(note, forKey: .note)
        try container.encode(image, forKey: .image)
        try container.encode(title, forKey: .title)
        try container.encode(reviews, forKey: .reviews)

        
    }
}
let defult = Eateries(name: "Trip Advisor ", place: "USA", note: "This is good place1", image: "https://media-cdn.tripadvisor.com/media/photo-s/16/56/3b/c9/local-cafes-and-eateries.jpg", title: "Eateries", reviews: [Review(revName: "review name", revNote: "review note"), Review(revName: "review name2", revNote: "review note2")])
let defult2 = Eateries(name: "Bob2", place: "new place2", note: "This is good place2", image: "https://ecowarriorprincess.net/wp-content/uploads/2019/09/8-Ethical-Eateries-in-Sydney-for-Sunday-Brunch.jpeg", title: "Eateries")
let defult3 = Eateries(name: "Tim3", place: "new place3", note: "This is good place3", image: "https://www.hiddencitysecrets.com.au/wp-content/uploads/2021/03/natural-history-public-restaurant-dining-restaurants-pubs-pub-diner-diners-eateries-eatery-melbourne-cbd-15.jpg", title: "Eateries")
//URL 4: https://cdn.trendhunterstatic.com/phpthumbnails/148/148264/148264_1_600.jpeg


/* create the class for basic data
 --------------------------------------------------------------------------------------------------*/

