//
//  User.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 13.03.2022.
//

import Foundation
import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "korshina",
            password: "12345",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    let dateOfBirth: String
    let adress: String
    let familyStatus: String
    let placeOfWork: String
    let hobbies: String
    let image: String
    
    static func getPerson() -> Person {
        Person(
            name: "Анастасия",
            surname: "Коршина",
            dateOfBirth: "4 ноября 1992 года",
            adress: "Санкт-Петербург",
            familyStatus: "Замужем, есть дочь",
            placeOfWork: "ООО \"Магистраль северной столицы\"",
            hobbies: "Люблю читать книги (фантастика, фэнтези); проводить время с семьей; кататься на велосипеде, самокате",            
            image: "IMG_3479"
        )
    }
}
