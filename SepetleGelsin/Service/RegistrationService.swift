//
//  RegistrationService.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 22.12.2021.
//

import Combine
import Foundation
import FirebaseDatabase
import FirebaseAuth


// Firebase'de depolanacak değerler.

enum RegistrationKeys: String {
    case firstName
    case lastName
}

// RegistrationDetails ile RegistrationService birbirine bağlanması. Hatasız çalışırsa void, hata verirse error döndürecek.

protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService{
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>{
        Deferred {
            Future { promise in
                
                // Firebase kullanıcı oluşturma komutu.
                
                Auth.auth()
                    .createUser(withEmail: details.email, password: details.password) { res, error in
                        
                        // Hata olup olmadığını kontrol etme.
                        
                        if let err = error {
                            promise(.failure(err))
                        }
                        
                        // Oluşturulan kullanıcının bilgilerini veritabanına kayıt ederek devam eder.
                        
                        else {
                            
                            // Oluşturulan kullanıcının veritabanındaki ID'sine ulaşma.
                            if let uid = res?.user.uid {
                                
                                // Firebase'de saklanacak kullanıcı verileri için sözlük oluşturulması.
                                
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName] as [String: Any]
                                
                                // Veritabanında her kullanıcı ID'si ile ayrı tablo oluşturuluyor, kullanıcı adı ve soyadı gibi bilgiler bu alt tablolarda bulunacak.
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        //Alt tablolar oluşturulurken hata oluşup oluşmadığının kontrolü.
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                                
                            }
                            
                            // Kullanıcı ID'sine erişirken bir sorun oluşursa programın çökmemesi için oluşturulan hata.
                            
                            else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                        
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
