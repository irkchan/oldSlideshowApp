//
//  ResultController.swift
//  SlideshowApp
//
//  Created by 吉田なつみ on 2021/09/29.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    var ResultImageSrc: UIImage!

   
    
    
//    表示した時に実行
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //image1 = UIImage(named:"img1")
        //image2 = UIImage(named:"img2")
        //image3 = UIImage(named:"img3")
        //resultImage.image = ResultImageSrc
        
        //ResultImageSrc = UIImage(named:"img2")
        
        resultImage.image = ResultImageSrc
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
