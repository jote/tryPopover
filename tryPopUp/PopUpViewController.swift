//
//  PopUpViewController.swift
//  tryPopUp
//
//  Created by jote_ on 2018/07/01.
//  Copyright © 2018年 jote. All rights reserved.
//

import Foundation
import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        let alertVc = UIAlertController(title: "Hoge", message: "huga", preferredStyle: .actionSheet)

        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("tapped ok")
        }

        let helpAction = UIAlertAction(title: "help", style: .default) { _ in
            print("tapped ok")
        }

        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { _ in
            print("tapped cancel")
            self.dismissToParentView()
        }
        alertVc.addAction(okAction)
        alertVc.addAction(helpAction)
        alertVc.addAction(cancelAction)

        alertVc.preferredContentSize = CGSize(width: self.view.frame.size.width - 60,
                                              height: self.view.frame.size.height - 60)
        alertVc.popoverPresentationController?.sourceRect = CGRect(x: view.center.x,
                                                                   y: contentView.frame.origin.y + 200,
                                                                   width: 0,
                                                                   height: 0)
        alertVc.popoverPresentationController?.sourceView = view
        alertVc.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)

        let adview = UIView(frame: CGRect(x: 0,
                                        y: -100,
                                        width: (alertVc.popoverPresentationController?.presentedView?.frame.width) ?? 150,
                                        height: 50))
        adview.backgroundColor = UIColor.green
        alertVc.view.addSubview(adview)
        present(alertVc, animated: false, completion: nil)
    }

    func dismissToParentView() {
        self.dismiss(animated: true, completion: nil)
    }
}
