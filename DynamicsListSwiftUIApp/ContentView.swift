//
//  ContentView.swift
//  DynamicsListSwiftUIApp
//
//  Created by wesley s favarin on 20/06/19.
//  Copyright © 2019 wesley s favarin. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let username, message, imageName: String
}


struct ContentView : View {
    
    let users: [User] = [
    .init(id: 0, username: "Tim Cook", message: "My nice shiny new monitor stand is $999", imageName: "tim_cook"),
        .init(id: 1, username: "Craig Federighi", message: "My nice shiny new monitor stand is $999", imageName: "craig_f"),
        .init(id: 2, username: "Jon Ivey", message: "My nice shiny new monitor stand is $999", imageName: "jon_ivey")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users.identified(by: \.id)) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("DynamicList"))
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            //                            .clipped()
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
