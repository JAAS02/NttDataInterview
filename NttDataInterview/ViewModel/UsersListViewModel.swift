
//
//  UsersListViewModel.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList : [UserModel] = []
    
    init(userList: Array<UserModel>) {
        self.userList = []
    }
    
    func getUsers()  {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("yep")
               print(error)
               return
           }
//            let statusCode = response as? HTTPURLResponse
//            print("Code: \(statusCode?.statusCode ?? 0)")
//            if let jsonString = String(data: data ?? Data(), encoding: .utf8) {
//                print("JSON RESPONSE: \(jsonString)")
//            }
           
           guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
               print("Error \(String(describing: response))")
               return
           }
            
           guard let data = data else { return }
           do {
               let decoder = JSONDecoder()
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               var decodedUsers = try decoder.decode([UserModel].self, from: data)
               DispatchQueue.main.async {
                   self.userList = decodedUsers
               }
               
           } catch(let e) {
               print(e)
               print("Error decoding JSON")
           }
            
        }.resume()
       
        
    }
}
