//
//  ContentView.swift
//  KullaniciEtkilesimi
//
//  Created by Yavuz Kaan Akyüz on 2.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alert = false
    @State private var actionSheet = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Alert") {
                alert = true
            }.alert("Başlık", isPresented: $alert, actions: {
                Button("İptal", role: .cancel,action: {
                    print("İptal Seçildi")
                })
                
                Button("Tamam", role: .destructive,action: {
                    print("Tamam Seçildi")
                })
                
            }, message: { Text("İçerik")})
            
            
            
            Button("Action Sheet")  {
                actionSheet = true
            }.actionSheet(isPresented: $actionSheet) {
                ActionSheet(title: Text("Başlık"), message: Text("İçerik"), buttons: [
                    .default(Text("İptal"), action: {
                        print("İptal Seçildi")
                    }),
                    .destructive(Text("Tamam"), action: {
                        print("Tamam Seçildi")
                    })
                    
                
                ])
            }
            
            
            Text("Context Menu")
                .contextMenu {
                    Button {
                        print("Resim Seçildi")
                    } label: {
                        Label("Resim Çek", systemImage: "camera")
                    }
                    
                    Button {
                        print("Video Seçildi")
                    } label: {
                        Label("Video Çek", systemImage: "video")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
