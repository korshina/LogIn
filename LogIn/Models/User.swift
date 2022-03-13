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
    
    let description: String
    let image: UIImage
    
    static func getPerson() -> Person {
        Person(
            name: "Анастасия",
            surname: "Коршина",
            description: "29 Лет. Родилась и живу в Санкт-Петербурге. Замужем, есть дочь. В настоящий момент работаю юристом в ООО \"Магистраль северной столицы\" - организации строящей и обслуживающей Западный скоростной диаметр. Хочу поменять сферу деятельности, и поэтому решила пойти в IT. В свободное время люблю читать книги. Преимущественно фантастику и фэнтези. Также люблю кататься на велосипеде, скейте и самокате. И обожаю проводить время со своей семьей.",
            image: UIImage(named: "IMG_3479")!
        )
    }
}
