//
//  UserModel.swift
//  socialNet
//
//  Created by Кирилл Крамар on 30.05.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//
import Foundation
struct User {
    let userName             : String
    let password             : String
    let firsName             : String
    let lastName             : String
    var age                  : Int
    let gender               : Gender
    var placeOfResidence     : Place
    var occupation           : Occupation
    var additionalInformation: String
}
extension User{
    static func getUser()-> User{
        return User(userName: "1",
                    password: "2",
                    firsName: "kirill",
                    lastName: "Kramar",
                    age: 19,
                    gender: .male,
                    placeOfResidence: Place(country: "Russia",
                                            region:"Kaliningrad region" ,
                                            city: "Kaliningrad"),
                    occupation: .studyAtUniversity,
                    additionalInformation: "Очень стыдно за  if else )"
                    )
    }
}
enum Gender:String {
    case male
    case female
}
struct Place {
    var country: String
    var region : String
    var city   : String
}
enum Occupation: String {
    case work
    case studyAtSchool
    case studyAtUniversity
}
