//
//  ViewController.swift
//  Multithread
//
//  Created by Thai Thi Tu Trinh on 10/4/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ibImage: UIImageView!
    @IBOutlet weak var ibDownloadButton: UIButton!
    @IBOutlet weak var ibNotification: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func ibDownloadImage(_ sender: Any) {
        
        //VẤN ĐỀ ĐẦU TIÊN: 
        let urlString = “https://..”
        let data = NSData(contentsOf: URL(string: urlString)!) //1
        img.ibImage = UIImage(data: data as! Data) //2
        //Mỗi một ứng dụng chúng ta có một main thread để xử lý các tác vụ liên quan tới UI. 
        //Ở đây chúng ta đã thực hiện một task đòi hỏi thời gian lâu là download hình ảnh từ internet về (//1) trên main thread. 
        //Main thread là một serial queue do đó chúng ta sẽ phải đợi việc download hình ảnh về rồi mới tiến hành các công việc khác (//2), 
        //điều này làm ứng dụng chúng ta không mượt và bị lag do thời gian đợi quá lâu. 
        //Chúng ta sẽ khắc phục chúng bằng cách thay đoạn code sau:
        DispatchQueue.global(qos: .userInitiated).async { //3
        let data = NSData(contentsOf: URL(string: urlString)!)
        DispatchQueue.main.async { //4
        img.ibImage = UIImage(data: data as! Data)
        }
         /*
            B3 chúng ta chuyển task đòi hỏi thời gian lâu này xuống background global queue và chạy chúng trong closure 1 cách bất đồng bộ(async). 
            Điều này làm cho hàm của chúng ta kết thúc nhanh trên main thread và tạo người dùng cảm giác mượt mà. 
            B4 chúng ta tiến hành gán hình ảnh đã down vào trong UIImageView. 
            Bởi vì việc cập nhật UI phải được thực hiện trên main queue nên chúng ta tạo một main queue và chạy đoạn code cập nhật hình ảnh.
            */  
        //--------------------------------------------// 
            //Hoãn việc chạy một task nào đó (Delaying task execution)

            let delayInSeconds = 1.0 //1
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { //2
            self.navigationItem.prompt = "I love you"
            }

            /*Ở bước 1 chúng ta đặc tả thời gian delay theo đơn vị giây. Bước 2, chúng ta sẽ đợi sau khoảng thời gian đã đặc tả ở trên
            để chạy bất đồng bộ đoạn code update UI trên main thread. 
            Chúng ta nên sử dụng asyncAfter với Main Queue (serial) và thận trọng khi sử dụng với Concurrent Queue*/
            */   
            
        //------------------------------------------//     
        //VẤN ĐỀ TIẾP THEO: Nếu muốn gọi hàm thông báo thành công khi đã load xong thì func displayAlert() sẽ hiển thị trước khi hình ảnh đc load
        
        /*let url = NSURL(string: "http://isushi.com.vn/media/4388/online-khth-iss-edit_slide-web.png")
        DispatchQueue.global().async {
            let data = NSData(contentsOf: url! as URL)
            DispatchQueue.main.async {
                self.ibImage.image = UIImage(data: data! as Data)
            }
            self.displayAlert()
        }*/
        
        
        //GIẢI QUYẾT
        
        //CÁCH 1: Dipatch Group cho phép chúng ta nhóm nhiều task với nhau và đợi cho chúng được hoàn thành hay được thông báo khi chúng được hoàn tất. Những task này có thể sync hay async và có thể chạy trên nhiều queue khác nhau. Dispatch Group cung cấp method wait mà nó block thread hiện tại cho tới khi tất cả các task trong group hoàn thành.
        //(4) : Bởi vì chúng ta sử dụng method đồng bộ wait mà nó block queue hiện tại
            //—> chúng ta cần sử dụng async để đưa toàn bộ method xuống background global queue nhằm đảm bảo không khoá main thread.
        //(5) : Chúng ta tạo mới một DispatchGroup
        //(6): Chúng ta gọi method enter() để báo với group rằng một task đã được bắt đầu
        //(7): Thông báo với group rằng task đã hoàn thành xong Chúng ta cần đảm bảo rằng số lượng lời gọi enter phải bằng 
            //với số lượng lời gọi leave để không bị crash app.
        //(8): Chúng ta gọi wait() nhằm block luồng hiện tại và đợi cho tất cả công việc trước đó trong group hoàn thành. 
            //Chúng ta có thể sử dụng wait(timeout:) để đặc tả thời gian timeout nhằm tránh việc đợi quá lâu
        //(9): Tại thời điểm này, tất cả hình ảnh đã được load xong hoặc timeout. Alert hiển thị nhằm thông báo hình ảnh được load xong.
        let url = NSURL(string: "http://isushi.com.vn/media/4388/online-khth-iss-edit_slide-web.png")
        
        DispatchQueue.global().async {
            let downloadGroup = DispatchGroup() //5
            downloadGroup.enter() //6
            let data = NSData(contentsOf: url! as URL)
            DispatchQueue.main.async {
                self.ibImage.image = UIImage(data: data! as Data)
            }
            downloadGroup.leave() //7
            downloadGroup.wait() //8
            DispatchQueue.main.async { //9
              self.displayAlert()
            }
        }
        
        
        //CÁCH 2:sử dụng dispatchgroup để thông báo (notify) khi nào công việc của một group hoàn thành
        DispatchQueue.global().async {
            let downloadGroup = DispatchGroup()
            downloadGroup.enter()
            let data = NSData(contentsOf: url! as URL)
            self.ibImage.image = UIImage(data: data! as Data)
            downloadGroup.leave()
            DispatchQueue.main.async { //không cần bao method trong lời gọi async bởi vì chúng ta không sử dụng wait để block main thread. DisparchGroup sẽ thông báo với chúng ta biết khi không còn một task nào trong group để chạy công việc chúng ta mong muốn trên queue được đặc tả.
                self.displayAlert()
            }
        }
        
        
        
    }
    
    func displayAlert(){
        let alert = UIAlertController(title: "Download", message: "The image downloads successful.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

