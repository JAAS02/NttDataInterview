
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
            ///En este ejemplo no se hace nada en caso de que ocurra un error, solo se mostrara el error en consola
            if let error = error {
               print(error)
               return
           }
            ///Si la respuesta que se obtiene de la API esta entre el rango 200 y 299 se considera como correcta y el flujo continua, sino se considerara como un error
           guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
               print("Error \(String(describing: response))")
               return
           }
            
           guard let data = data else { return }
           do {
               let decoder = JSONDecoder()
               ///Al decoder se le asigna la estrategia para realizar la decodificacion en caso de que la API regrese algun valor con formato snake_case
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               let decodedUsers = try decoder.decode([UserModel].self, from: data)
               ///Se le informa al hilo principal sobre los cambios para que realice la actualizacion de la variable
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
