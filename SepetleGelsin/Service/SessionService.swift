//
//  SessionService.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 22.12.2021.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

//Oturumun açık veya kapalı olduğu durumların tanımlanması.
enum SessionState {
    case loggedIn
    case loggedOut
}

protocol SessionService {
    
    //Oturum durumu
    var state: SessionState { get }
    
    //Kullanıcı detayları, kullanıcı giriş yapana kadar boş olacak.
    var userDetails: SessionUserDetails? { get }
    
    //Çıkış yapma fonksiyonu
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    //Oturum durumu çıkış yapılmış olarak tanımlandı.
    @Published var state: SessionState = .loggedOut
    
    //Kullanıcı bilgileri eğer varsa değişkenlere eşitlendi.
    @Published var userDetails: SessionUserDetails?
    
    //Kullanıcı durumunun değişkenliği firebase komutu ile kontrol edildi.
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFirabaseAuthHandler()
    }
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension SessionServiceImpl {
    func setupFirabaseAuthHandler() {
        
        
        //Kullanıcının giriş veya çıkış yaptığı kontrol edildi.
        handler = Auth
            .auth()
            .addStateDidChangeListener{ [weak self] res, user in
                guard let self = self else { return }
                self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid {
                    self.handleRefresh(with: uid)
                }
            }
    }
    func handleRefresh(with uid: String) {
        
        //Kullanıcının adı ve soyadı gibi kullanıcıya özel bilgilerine kullanıcı ID'si ile erişip değişkenlere tanımlandı.
        Database
            .database()
            .reference()
            .child("users")
            .child(uid)
            .observe(.value) { [weak self] snapshot in
                
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let firstName = value[RegistrationKeys.firstName.rawValue] as? String,
                      let lastName = value[RegistrationKeys.lastName.rawValue] as? String else {
                          return
                      }
                //Bu işlemlerin arkaplanda uygulamamızı kitlemeden çalışması için dispatchQueue kullanıldı.
                DispatchQueue.main.async {
                    self.userDetails = SessionUserDetails(firstName: firstName, lastName: lastName)
                }
            }
    }
}
