//
//  ViewController.swift
//  ConnectToWifi
//
//  Created by Luigi Aiello on 03/05/2019.
//  Copyright © 2019 Luigi Aiello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    
    // MARK: - Variables
    private let ssid: String = "ABWIFI-Web&App"
    private let password: String = "@Benergiewifi@"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Helpers
    private func connectToWifi() {
        NEHotspotManager.simpleConnectionToWifi(ssid: ssid, password: password, isWEP: false, completionHandler: NEHotspotCallback(onSuccess: { (_) in
            self.connectionStatusLabel.text = "Connected"
            self.connectionStatusLabel.text = NEHotspotManager.getGatewayIP()
        }, onError: { (error) in
            switch error {
            case .usingSimulator:
                self.connectionStatusLabel.text = "This feature is not available on the simulator"
            case .generic(let error):
                self.connectionStatusLabel.text = error.localizedDescription
            case .unknown:
                self.connectionStatusLabel.text = "Unknown error"
            }
        }))
    }
    
    // MARK: - Actions
    @IBAction func connectDidTap(_ sender: Any) {
        connectToWifi()
    }
}
