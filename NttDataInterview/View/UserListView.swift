//
//  UserListView.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject var userListViewModel = UserListViewModel(userList: [])
    
    var body: some View {
        NavigationStack{
            ZStack{
                ///El ZStack es necesario para que las esferas en el background se queden en el fondo de la vista
                BackgroundSpheresView(positionBlue: SpherePosition.left, positionOrange: SpherePosition.right, positionPurple: SpherePosition.center)
                VStack(alignment: .leading){
                    Text("Usuarios disponibles")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.leading, 24)
                    List(userListViewModel.userList){ user in
                        UserCardView(name:  user.name, email:  user.email,phone: user.phone).buttonStyle(.plain)
                            .listRowInsets(EdgeInsets())
                            .background(
                                NavigationLink(destination: {
                                    ///Se pasa la informacion del usuario como parametro para evitar realizar otra peticion a la API
                                    UserDetailView(userInfo: user)
                                }, label: {
                                    
                                })
                            )
                    }
                    .background(Color.clear)
                    .scrollContentBackground(.hidden) ///Esto es necesario para ocultar el poton que agrega por si solo la Lista
                    .listRowSpacing(8)
                    Spacer()
                }
            }
            .background(Color(.background))
        }
        .accentColor(.white)
        .task {
            ///La peticion se hace desde el .task ya que este esta hecho para soportar peticiones asincronas
            userListViewModel.getUsers()
        }
            
        
    }
}

