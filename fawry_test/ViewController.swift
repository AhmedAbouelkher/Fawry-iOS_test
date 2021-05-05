//
//  ViewController.swift
//  fawry_test
//
//  Created by Ahmed Mahmoud on 05/05/2021.
//

import UIKit
import MyFawryPlugin

class ViewController: UIViewController {
    
    private var fawry: Fawry!
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Click me", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        fawry = Fawry.sharedInstance
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        
        button.center = view.center
    }
    
    
    @objc
    private func didTapButton() {
        var itemsList: [Item]
        
        itemsList = [Item]()
        
        
        let item = Item(productSKU: "sss", productDescription: "ss", quantity: 1, price: 20.0)
        let item2 = Item(productSKU: "44sss", productDescription: "ss88", quantity: 2, price: 10.0)
        
        itemsList.append(item)
        itemsList.append(item2)
        
        fawry.customerMobileNumber = "011xxxxxxxx"
        fawry.customerEmailAddress = "test@mail.com"
        fawry.customerCIF = "4545456"
        fawry.skipCustomerInput = true
        
        
        /*===   Payment  ===*/
        fawry.initialize(
            serverURL: "https://atfawry.fawrystaging.com",
            styleParam: ThemeStyle(
                primaryColor: .red,
                primaryDarkColor: .red,
                secondaryColor: .red,
                secondaryDarkColor: .red
            ),
            merchantIDParam: "2n5QDrrCsUU=",
            merchantRefNum: "MerchantRefNumValue",
            languageParam: "en",
            GUIDParam: "#@DDFFEEER",
            customeParameterParam: nil,
            currancyParam: .EGP,
            items: itemsList
        )
        
        fawry.showSDK(onViewController: self) { (transactionID, statusCode) in
            if transactionID != nil {
                
            }
        }
    }
}

