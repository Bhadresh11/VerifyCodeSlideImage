//
//  VerifyCodeDelegateWrapper.swift
//  VerifyCodeSlideImage
//
//  Created by Bhadresh on 16/08/23.
//

import Foundation

class VerifyCodeDelegateWrapper: NSObject, ObservableObject, NTESVerifyCodeManagerDelegate {
    
    @Published var verificationResult = false
    let verifyManager = NTESVerifyCodeManager.getInstance()

    var isSuccess: Bool = false
    override init() {
        super.init()
    }
    
    var didGetVerificationcode:((Bool, String?) -> ())?
    
    func showVerificationView(completion:  @escaping (Bool, String?) ->()) {
        didGetVerificationcode = completion
        self.verifyManager?.configureVerifyCode("9b8a2163bedd48059675adf8856f59e7", timeout: 10)
        self.verifyManager?.delegate = self
        self.verifyManager?.mode = .normal
        self.verifyManager?.lang = .ENUS
        self.verifyManager?.alpha = 0.3
        self.verifyManager?.userInterfaceStyle = .dark
        self.verifyManager?.color = UIColor.black
        self.verifyManager?.protocol = .https
        self.verifyManager?.openFallBack = true
        self.verifyManager?.fallBackCount = 3
        self.verifyManager?.openVerifyCodeView()
    }
    
    func verifyCodeValidateFinish(_ result: Bool, validate: String?, message: String!) {
        didGetVerificationcode?(result,validate)
    }
}
