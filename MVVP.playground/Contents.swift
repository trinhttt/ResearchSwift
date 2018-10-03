//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//****6 rules
//https://viblo.asia/p/swift-nhung-loi-ich-cua-mvvm-model-view-viewmodel-GrLZDAyglk0
//Model
//Model trong MVVM bao gồm Business Layer và API layer.
//Đó là trách nhiệm của business rule, data access, model class…

//ViewModel:
//ViewModel chuẩn bị tất cả thông tin cho giao diện người dùng. Nó giao tiếp với ViewController thông qua một protocol và cung cấp một cách dễ dàng để kiểm thử toàn bộ ViewController.
public protocol UserProfileHeaderVMProtocol {
    
     var fullName: String { get }
     var subtitleText: String { get }
     var backgroundImage: UIImage { get }
     var avatarImage: UIImage { get }
     var friendRequestButtonEnabled: Bool { get }
     func sendFriendRequest()
}  public class UserProfileHeaderVM: NSObject, UserProfileHeaderVMProtocol {
}
//View:
//đại diện cho toàn bộ giao diện người dùng có thể nhìn thấy bởi người dùng và bao gồm cả UIViewController và UIView
public class UserProfileHeaderView: UIView {
    
     let avatarImageView = UIImageView()
     let backgroundImageView = UIImageView()
     let fullNameLabel = UILabel()
     let subtitleLabel = UILabel()
     let friendRequestButton = UIButton()
    
    init() {
        super.init(frame:CGRect.zero)
    }
}
//ViewController hoạt động như cầu nối giữa ViewModel và View và nó không biết gì về business logic.
public class UserProfileHeaderVC: UIViewController {
    
    private var userProfileHeaderView: UserProfileHeaderView {
        return self.view as! UserProfileHeaderView
    }
    
    private let viewModel: UserProfileHeaderVMProtocol = UserProfileHeaderVM()
    
    override func loadView() {
        view = UserProfileHeaderView()
        userProfileHeaderView.friendRequestButton.addTarget(
            self,
            action: #selector(addFriendRequestAction(_:)),
            forControlEvents: .TouchUpInside )
        
        bindViewModel()
    }
    private func bindViewModel() {
        userProfileHeaderView.avatarImageView.image = viewModel.avatarImage
        userProfileHeaderView.backgroundImageView.image = viewModel.backgroundImage
        userProfileHeaderView.fullNameLabel.text = viewModel.fullName
        userProfileHeaderView.subtitleLabel.text = viewModel.subtitleText
        userProfileHeaderView.friendRequestButton.enabled = viewModel.friendRequestButtonEnabled
    }
    @objc private func addFriendRequestAction(sender: UIButton) {
        viewModel.sendFriendRequest()


