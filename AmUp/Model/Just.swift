//
//  Just.swift
//  AmUp
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 8/26/21.
//

import Foundation
import Just



func fetchData() {
    
    let justDefault = JustSessionDefaults(
        headers: ["AUTH-TOKEN": UserDefaultsHelper.getData(type: String.self, forKey: .authToken)!]
    )
    
    let just = JustOf<HTTP>(defaults: justDefault)
    
    just.post(
        "http://94.130.88.31:8380/api/home",
        json: ["latitude" : 1.3,"longitude" : 2.3], asyncCompletionHandler:  { r in
            print(r.statusCode!)
            if r.ok {
                let json = r.json as? [JSONDecoder]
                
                print(json)
            }else {
                print(r.error)
            }
        })
}
