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
                BackgroundSpheresView(positionBlue: SpherePosition.left, positionOrange: SpherePosition.right, positionPurple: SpherePosition.center)
                VStack(alignment: .leading){
                    Text("Usuarios disponibles")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    List(userListViewModel.userList){ user in
                        UserCardView(name:  user.name, email:  user.email,phone: user.phone).buttonStyle(.plain)
                            .listRowInsets(EdgeInsets())
                            .background(
                                NavigationLink(destination: {
                                    UserDetailView(userInfo: user)
                                }, label: {
                                    
                                })
                            )
                    }
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .listRowSpacing(8)
                    
                    Spacer()
                }
            }
            .background(Color(.background))
        }
        .accentColor(.white)
        .task {
            userListViewModel.getUsers()
        }
            
        
    }
}

