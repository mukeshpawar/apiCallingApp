//
//  ApiManager.swift
//  ApiCallingApp
//
//  Created by Mukesh Pawar on 21/06/22.
//

import Foundation
import PromiseKit


// 1
enum APIError: Error {
    case invalidUrl
    case errorDecode
    case failed(error: Error)
    case unknownError
}


class APIManager {
    
    private let sourcesURL = URL(string: Constants.WebServices.kServerURL)!
      

    func apiToGetUserData(completion : @escaping (User) -> ()){
          URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
              if error != nil {
                print("dataTask error: \(error!.localizedDescription)")

              }else if let data = data {

                  print("DATA",data);
                  do{

                  let empData = try JSONDecoder().decode(User.self, from: data)
                      completion(empData )
                  } catch{
                      print("decoding error ")
                  }
              } else {
                  print("unknown dataTask error")
              }
          }.resume()
      }
    
    
    
//    func apiToGetUserDatanew() -> Promise<User> {
//
//      return Promise { seal in
//        let sourcesURLnew = URL(string: Constants.WebServices.kServerURL)!
//
//        URLSession.shared.dataTask(with: sourcesURLnew) { data, _, error in
//          guard let data = data,
//                let result = try? JSONDecoder().decode(User.self, from: data) else {
//            let genericError = NSError(
//              domain: "PromiseKitTutorial",
//              code: 0,
//              userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
//            seal.reject(error ?? genericError)
//            return
//          }
//
//          seal.fulfill(result)
//        }.resume()
//      }
//    }
//
  

}






