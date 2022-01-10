//
//  RegistrationViewModel.swift
//  SepetleGelsin
//
//  Created by Bedirhan Ulas on 22.12.2021.
//

import Foundation
import Combine


//Kayıt sırasında oluşabilecek senaryoların tanımlanması.

enum RegistrationState {
    
    case successfull
    case failed(error : Error)
    case na
}

//Kayıt için tanımlanan elemanların çağrılması

protocol RegistrationViewModel {
    func register()
    var hasError: Bool { get }
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    @Published var hasError: Bool = false
    
    
    // Kayıt durumu başlangıçta boş duruma getirildi
    @Published var state: RegistrationState = .na
    
    
    
    let service: RegistrationService
    
    // Kullanıcı bilgileri alındı
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    // Sunucu ile uygulamanın eşleştirilmesi
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    // Kayıt fonksiyonu
    func register() {
        
        
        // Kullanıcı kayıdı gerçekleştirilirken hata oluşursa break komutu ile işlem sonlandırılacak ve state değişkeni failed olarak değişecek.
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            
            // Hata oluşmazsa state değişkeni successfull olarak değişecek.
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
    }
    
}

private extension RegistrationViewModelImpl {
    func setupErrorSubscriptions() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfull,
                        .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
