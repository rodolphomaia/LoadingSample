//
//  BaseViewController.swift
//  LoadingSample
//
//  Created by Rodolpho Maia on 03/01/21.
//

import UIKit
import Lottie

class BaseViewController: UIViewController {

    var animationView: CustomLoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showLoading()
        // Do any additional setup after loading the view.
    }
    
    func showLoading(){
        self.animationView = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CustomLoadingView
        
        self.animationView?.frame = self.view.frame
        self.view.addSubview(animationView ?? UIView())
        self.animationView?.playAnimation()
    }
    
    func hideLoading(){
        self.animationView?.stopAnimation()
        self.animationView?.isHidden = true
    }
}

class CustomLoadingView: UIView{
    
    @IBOutlet weak var animationLoadingView: AnimationView!
    
    func playAnimation(){
        
        self.animationLoadingView.loopMode = .loop
        self.animationLoadingView.contentMode = .scaleAspectFit
        self.animationLoadingView.play()
    }
    
    func stopAnimation(){
        
        self.animationLoadingView.stop()
    }
}
