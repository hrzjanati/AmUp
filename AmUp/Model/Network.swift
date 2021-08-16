//
//  Network.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/24/21.
//

import Foundation
import Alamofire
import UIKit

class NetworkCall : NSObject{

    enum services :String{
        case posts = "posts"
    }
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = "http://94.130.88.31:8380/api/register"
    var encoding: ParameterEncoding! = JSONEncoding.default

    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if url == nil, service != nil{
            self.url += service!.rawValue
        }else{
            self.url = url
        }
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print("Service: \(service?.rawValue ?? self.url ?? "") \n data: \(parameters)")
    }

    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                            
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
/*
 
 alamofire simperl req
 
 AF.request("http://94.130.88.31:8380/api/register"
            ,method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: ["Content-Type" : "application/json"]
 ).response {response in
     print(response.data ?? "")
 }

 */
  
