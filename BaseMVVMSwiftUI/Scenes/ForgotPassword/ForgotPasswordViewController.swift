//
//  ForgotPasswordViewController.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import SwiftUI

class ForgotPasswordViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSendAction(_ sender: Any) {
        let successView = SuccessView(title: "Sucesso", subTitle: "Email enviado com sucesso!")
        let hostingView = UIHostingController(rootView: successView)
        navigationController?.pushViewController(hostingView, animated: true)
    }
}
