//
//  NetworkManager.swift
//  TableAPI
//
//  Created by Field Employee on 10/29/20.
//

import UIKit

final class NetworkManager {
    
    static var shared: NetworkManager = NetworkManager()  
    let session: URLSession
    private init(session: URLSession = URLSession.shared){
        self.session = session
    }
    
}

extension NetworkManager {
    
    func fetchImage(str:String, completion: @escaping (UIImage?,String?)->()){
    
        guard let url = URL(string: str ) else {
            completion(nil,nil)
            return
        }
        
        self.session.dataTask(with: url) { (data,response,error) in
            if let _ = error {
                completion(nil,nil)
                return
            }
            else{
                guard let respBody = data else {
                    completion(nil,nil)
                    return
                }
                var id: String?
                if let result = response as? HTTPURLResponse {
                    id = result.value(forHTTPHeaderField: "picsum-id")
                }
                completion(UIImage(data: respBody),id)
            }
        }.resume()
    }
}
