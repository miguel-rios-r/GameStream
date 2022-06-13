//
//  ContentView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Color("Bg-Color").ignoresSafeArea()
                
                VStack{
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit).frame(width: 250)
                        .padding(.bottom, 42)
                    LoginView()
                }
            }
        }
    }
}

struct LoginView: View {
    
    @State var loginState = true
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Button("Login") {
                    loginState = true
                    print("Login user...")
                }
                .foregroundColor(loginState == true ? .white : .gray)
                Spacer()
                Button("Sign Up") {
                    loginState = false
                    print("Signing user...")
                }
                .foregroundColor(loginState == false ? .white : .gray)
                Spacer()
            }
            Spacer(minLength: 42)
            if loginState == true {
                LoginScreenView()
            } else {
                SignupScreenView()
            }
            Spacer()
            
        }
    }
}

struct LoginScreenView: View {
    @State var correo = ""
    @State var pass = ""
    @State var logged = false
    
    func loginUser(){
        print("Loging user")
        logged = true
    }
    
    var body: some View{
        ScrollView {
            VStack(alignment:.leading) {
                
                Text("Email")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment:.leading){
                    if correo.isEmpty{
                        Text("example@email.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(Color(.white))
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Password")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment:.leading){
                    if correo.isEmpty{
                        Text("·····")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $pass)
                        .foregroundColor(Color(.white))
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Olvidaste tu contraeeña")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: loginUser, label: {
                    Text("Login me")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center )
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("Dark-Cian"),
                                    lineWidth: 1.0).shadow(color: .white, radius: 6)
                        )
                }).padding(.bottom, 70)
                
                Text("Start with")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.bottom)
                HStack{
                    Spacer()
                    Button(action: loginWithFacebook, label: {
                        Text("Facebook")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    })
                    Spacer()
                    Button(action: loginWithGoogle, label: {
                        Text("Google")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .center)
                
                
            }.padding(.horizontal, 77.0)
            NavigationLink(
                destination: Home(),
                isActive: $logged,
                label: {
                    EmptyView()
                }
            )
        }
    }
}

func loginUser(){
    print("Loging user")
    //logged = true
}

func loginWithFacebook(){
    print("Loging user with facebook")
}

func loginWithGoogle(){
    print("Loging user with google")
}

struct SignupScreenView: View {
    @State var correo = ""
    @State var pass = ""
    @State var confirmPass = ""
    var body: some View{
        ScrollView {
            VStack {
                Text("Set your profile photo")
                    .foregroundColor(Color.white)
                Text("You could skip and set after")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button(action: captureProfilePhoto, label: {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                    
                }).padding(.bottom, 70)
                
                VStack(alignment:.leading) {
                    
                    VStack{
                        Text("Email")
                            .foregroundColor(Color("Dark-Cian"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment:.leading){
                            if correo.isEmpty{
                                Text("example@email.com")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $correo)
                                .foregroundColor(Color(.white))
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color("Dark-Cian"))
                            .padding(.bottom)
                        
                        Text("Password")
                            .foregroundColor(Color("Dark-Cian"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment:.leading){
                            if pass.isEmpty{
                                Text("·····")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $pass)
                                .foregroundColor(Color(.white))
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color("Dark-Cian"))
                            .padding(.bottom)
                        
                        Text("Confirm Password")
                            .foregroundColor(Color("Dark-Cian"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment:.leading){
                            if confirmPass.isEmpty{
                                Text("·····")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $confirmPass)
                                .foregroundColor(Color(.white))
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color("Dark-Cian"))
                            .padding(.bottom)
                        
                        Text("Olvidaste tu contraeeña")
                            .font(.footnote)
                            .frame(width: 300, alignment: .trailing)
                            .foregroundColor(Color("Dark-Cian"))
                            .padding(.bottom)
                    }
                    
                    Button(action: loginUser, label: {
                        Text("Login me")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center )
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                        .stroke(Color("Dark-Cian"),
                                        lineWidth: 1.0).shadow(color: .white, radius: 6)
                            )
                    }).padding(.bottom, 70)
                    
                    Text("Start with")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    HStack{
                        Spacer()
                        Button(action: loginWithFacebook, label: {
                            Text("Facebook")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                                
                        })
                        Spacer()
                        Button(action: loginWithGoogle, label: {
                            Text("Google")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        })
                        Spacer()
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }.padding(.horizontal, 77.0)
            }
        }
    }
}

func captureProfilePhoto(){
    print("Capturing profile photo")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
