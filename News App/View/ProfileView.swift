//
//  ProfileView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 02/08/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        Image("FathurPic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .padding( .top, 20)
                            .cornerRadius(50)
                            .shadow(color: Color.black.opacity(0.5), radius: 3)
                        Text("Muhammad Fathurrahman")
                            .font( .title2)
                            .fontWeight( .semibold)
                        Text("Student at Dicoding Academy").italic()
                        ButtonView()
                        Spacer()
                    }
                }.background(Color(red: 230/255, green: 230/255, blue: 230/255)).padding(.top, 1)
                    .navigationBarTitle("My Profile")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct ButtonView: View {
    @State private var showSF = false
    var body: some View {
        VStack {
            Button {
                openIg()
            } label: {
                HStack {
                    Image("Instagram")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Follow me")
                        .foregroundColor(.white)
                }.frame(width: 200, height: 45).background(Color.blue.opacity(0.7)).cornerRadius(10).padding(.top, 20)
            }
            Button {
                showSF = true
            } label: {
                HStack {
                    Image(systemName: "network")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("fathur.tk")
                        .foregroundColor(.white)
                }.frame(width: 200, height: 45).background(Color.blue.opacity(0.7)).cornerRadius(10)
            }
            Spacer()
                .padding(.top, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Text("Belajar").foregroundColor(.white).font(.title3)
                        Text("2").foregroundColor(.white).font(.title)
                        Text("Kelas Akademi").foregroundColor(.white).font(.title).multilineTextAlignment(.center)
                    }.padding( .vertical, 50).frame(width: 250).background(Color(red: 44 / 255, green: 187 / 255, blue: 185 / 255)).cornerRadius(15)
                    VStack(spacing: 10) {
                        Text("Memenangkan").foregroundColor(.white).font(.title3)
                        Text("0").foregroundColor(.white).font(.title)
                        Text("Challenge").foregroundColor(.white).font(.title)
                    }.padding( .vertical, 50).frame(width: 250).background(Color(red: 159 / 255, green: 97 / 255, blue: 203 / 255)).cornerRadius(15)
                    VStack(spacing: 10) {
                        Text("Menghadiri").foregroundColor(.black).font(.title3)
                        Text("0").foregroundColor(.black).font(.title)
                        Text("Event").foregroundColor(.black).font(.title)
                    }.padding( .vertical, 50).frame(width: 250).background(Color(red: 238 / 255, green: 255 / 255, blue: 75 / 255)).cornerRadius(15)
                }.padding()
            }
            Spacer()
                .sheet(isPresented: $showSF, content: {
                    if let urlString = "https://www.fathur.tk/", let url = URL(string: urlString) {
                        SFSafariView(url: url)
                    }
                })
        }
    }
    private func openIg() {
        let url = URL(string: "https://www.instagram.com/_maxyyyy/?hl=id")
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}
