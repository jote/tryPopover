//
//  ViewController.swift
//  tryPopUp
//
//  Created by jote_ on 2018/07/01.
//  Copyright © 2018年 jote. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var popupButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var customAlertButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapAlertButton(_ sender: Any) {
        print("tap alert button")
        let alertVc = UIAlertController(title: "Hoge", message: "huga", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("tapped ok")
        }
        let helpAction = UIAlertAction(title: "help", style: .default) { _ in
            print("tapped ok")
        }

        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { _ in
            print("tapped cancel")
        }
        alertVc.addAction(okAction)
        alertVc.addAction(helpAction)
        alertVc.addAction(cancelAction)

        alertVc.popoverPresentationController?.sourceView = view
        alertVc.popoverPresentationController?.permittedArrowDirections = .up


        let adview = UIView(frame: CGRect(x: 0,
                                          y: -100,
                                          width: (alertVc.popoverPresentationController?.presentedView?.frame.width) ?? 200,
                                          height: 50))
        adview.backgroundColor = UIColor.green
        alertVc.view.addSubview(adview)
        present(alertVc, animated: false, completion: nil)
    }


    //引用 https://stackoverflow.com/questions/32790207/uialertcontroller-add-custom-views-to-actionsheet
    @IBAction func OnTapAlertCustomButton(_ sender: UIButton) {
        let ac = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)

        let margin:CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: ac.view.frame.width - margin * 2, height: 20)
        let customView = UIView(frame: rect)

        customView.backgroundColor = .green
        ac.view.addSubview(customView)

        let somethingAction = UIAlertAction(title: "Something", style: .default, handler: {(alert: UIAlertAction!) in print("something")})

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})

        ac.addAction(somethingAction)
        ac.addAction(cancelAction)

        ac.popoverPresentationController?.sourceView = view
        ac.popoverPresentationController?.sourceRect = sender.frame

        self.present(ac, animated: true) {
            print("00000000 \(ac.view.frame) 00000000")
        }
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    @IBAction func onTapPopupButton(_ sender: UIButton) {
        print("taped popup button!")

        let storyBoard = UIStoryboard(name: "Popup", bundle: nil)
        let popupView = storyBoard.instantiateViewController(withIdentifier: "popupView") as! PopUpViewController
        popupView.modalPresentationStyle = .popover
        popupView.popoverPresentationController?.backgroundColor = UIColor.red
        popupView.preferredContentSize = CGSize(width: 400, height: 500)
        popupView.popoverPresentationController?.sourceView = view
        popupView.popoverPresentationController?.sourceRect = sender.frame
        popupView.popoverPresentationController?.permittedArrowDirections = .any
        popupView.popoverPresentationController?.delegate = self
        present(popupView, animated: true, completion: nil)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
}


