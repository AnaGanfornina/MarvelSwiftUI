//
//  Endpoints.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//

import Foundation

enum Endpoints: String{
    case series = "series?ts=1&hash=3160cdaacb3b4de19403d9f2d114541a&apikey=d081400988e3eba17bfa9caf2d2c941a"
    case characters = "characters?ts=1&hash=3160cdaacb3b4de19403d9f2d114541a&apikey=d081400988e3eba17bfa9caf2d2c941a"
    
    
    //TODO: Por intentar
    /*
    case series = "series?ts=\(ConstatsApp.CONST_TS)&hash=\(ConstatsApp.CONST_HASH)&apikey=\(ConstatsApp.CONST_API_KEY.rawv)"
    case characters = "characters?ts=\(ConstatsApp.CONST_TS)&hash=\(ConstatsApp.CONST_HASH)&apikey=\(ConstatsApp.CONST_API_KEY)"
    */
}

