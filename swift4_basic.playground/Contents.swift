import Cocoa

//// 1.Khai niem co ban  ////
//// 2.Toan tu co ban    ////
//// 3. Mang             ////
//// 4. Kieu tap hop SET ////
//// 5. FUNCTION         ////
//// 6. Enum + Switch    ////
//// 7. Struct_basic     ////
//// 8. Class            ////
//// 9. Extension        ////
//// 10. If let và guard ////
//// 11. Initialization (khởi tạo) ////
//// 12. ALL KEYWORDS IN SWIFT ////

////-----------------1.Khai niem co ban-----------------////

//Biến hằng
let a1 = 1
//Biến có thể thay đổi
var a2=2
a2=a1


// : Chú thích về kiểu
var c1,c2,c3:Double
//Tên biến có thể gồm ký tự
var c4:Int, c5:String, c6="💔", 😄:Int=1
// \()
print("1.c6=\(c6), 😄=\(😄)")


// Số nguyên k dấu 64 bit
let d1:UInt64 = 1
// Số nguyên k dấu 8 bit <pham vi 64
let d2:UInt8 = 2
// Chuyển sang kdl có phạm vi rộng hơn
let d3 = d1 + UInt64(d2)


// ĐN lại KDL
typealias e = Int
var e1:e=1
print(e1)


var age = -1
//assert kiểm tra dk khi in ra gtri va in lỗi ra
///assert(age>=0,"Tuoi phai lon hon 0")
// giống assert nhưng k chạy tiếp những dòng kế (dừng tại đây)
///precondition(age>=0,"Tuoi phai lon hon 0")

////-----------------2.Toan tu co ban-------------------////

//bool
let t:Bool=true
let f = !t

//tuple
let (a,b)=(1,2)

//Cộng chuỗi
let cong="a"+"b"

//ss 2 tuples: ss từng phần tử-> output: true/false
(1,"a")<(2,"b")//1<2&&"a"<"b" =>true

// ? :
let isHD=(a,b)>(1280,720) ? "hd" : "not hd"

// ??
let tt:Int? = nil
let myAge = tt ?? 21//age = nil nên myAge=21

//for
for i in 1..<5{
    print(i)
}
//for nếu k biết trc số phần tử
let arr=["a","b","c"]
for a in arr[0...]// hoac ...2
{
    print(a)
}

//...a nghĩa là all so <=a
let r = ...5
r.contains(6)//return false


// Đoạn trích, giữ nguyên định dạng: """ ... """
let dtr="""
T
r
i
n
h
"""
print(dtr)


// String(isEmpty, append), character
var str1="Thai Thi"
var str2="Tu Trinh"
if !str1.isEmpty && !str2.isEmpty
{
    var str3=str1+" "+str2
    str3.append("❤️")//them vao cuoi
    for i in str3{
        let tam="character: \(i)" //thay vi ghi o duoi
        print(tam)
    }
}


// Có thể chèn ký tự đặt biệt vào bằng cách seach : Unicode character rồi copy mã vào(bỏ U+)
print("2.\u{019B}")


//startIndex và endIndex
print(str1[str1.startIndex])
//lỗi vì ký tự cuối k phải i trong "Thai Thi"
///print(str1[str1.endIndex])
//sữa lại:
print(str1[str1.index(before: str1.endIndex)])


//lay 1 ky tu nao do trong chuoi
print(str1[str1.index(str1.startIndex, offsetBy: 1)])
//lấy 1 chuỗi trong String
let lc = str2[str2.startIndex...str2.index(str2.startIndex, offsetBy: 3)]

//insert 1 ky tu
str1.insert("E", at: str1.startIndex)
str1.insert(contentsOf: "End", at: str1.endIndex)


//index in str.indices
for index in str1.indices{// k thay dc index(type)
    print(str1[index])
}

//so sanh chuoi
if str1 == str2 {
    print("2.Equal")
}

let strPrefix = "Thai Thi"
strPrefix.hasPrefix("Thai")//true

let strSuffix = "Tu TrInH"
strSuffix.hasSuffix("Trinh")//false
strSuffix.uppercased().hasSuffix("TRINH")//true

////-----------------3. Mang-------------------////

//tao mang, them phan tu vao mang, lay so phan tu cua mang
var arrDoubles = [Double]()
arrDoubles.append(10.02)
arrDoubles.append(12.05)
print("3.so luong phan tu cua arr la: \(arrDoubles.count)")

//Tao mang vs cac phan tu lap lai, vd: [3,3,3,3,3]
var arr_Int1 = Array(repeating: 3, count: 5)


//Cong mang cung loai bang toan tu "+" vs ca so nguyen va chuoi
var arr_Int2 = Array(repeating: 5, count: 3)
var sum_Int = arr_Int1+arr_Int2 //[3,3,3,3,3,5,5,5]

var arr_str1=["A","B"]
var arr_str2=["C","D"]
var sum_str=arr_str1+arr_str2 //sum_str=["A","B,"C","D"]
sum_str.insert("E", at: sum_str.endIndex)//sum_str=["A","B,"C","D","E"]
sum_str.remove(at: 1)//sum_str=["A","C","D","E"]

//for vs tuple. Dung enumerated
for (index,value) in sum_str.enumerated(){
    print("3.index=\(index), value=\(value)")
}

for index in stride(from: 1, to: 15, by: 0.5)
{
    print("3.stride index=\(index)")
}
////-----------------4. Kieu tap hop SET-------------------////
///SET: KDL khong quan tam den cach sap xep cua no

var set_str: Set<String>=["A","B","C"]

///Giong Array
print(set_str.count)//3

if set_str.isEmpty{
    print("4.Rong")
}else
{
    for i in set_str{
        print(i)
    }
}

set_str.remove("C")//A,B

if set_str.contains("A"){
    print("4.Co chua A")
}else{
    print("4. K chua A")
}

///khac vs Array
//Array la append
set_str.insert("D")

//Lay GIAO cua 2 tap hop
var set1:Set=[1,2,3]
var set2:Set=[5,6,1,2]
var set_giao=set1.intersection(set2)//Output có thể là [1,2] hoặc [2,1]
var set_bu_cua_giao=set1.symmetricDifference(set2)//K lay phan tu chung ->[3,5,6]
//Kết quả k có thứ tự nên muốn hiển thị tăng dần =>dùng sorted()
set_giao.sorted()//[1,2]

//Lay HOP cua 2 tap hop
var set_hop=set1.union(set2).sorted()//[1,2,3,5,6]

//Co o set1 nhung k co o set 2:[3]
var set1_tru_giao=set1.subtracting(set2).sorted()//Hieu 2 tap hop

//Kiem tra tap hop con
let foods:Set=["🍖","🍔"]
let foods_drinks:Set=["🍺","🍷","🍖","🍔"]

//ktra foods_drinks co chua foods k
let check1=foods_drinks.isSuperset(of: foods)//true
//ktra foods co phai tap hop con cua foods_drinks k
let check2=foods.isSubset(of: foods_drinks)

let animals:Set=["cat","dog"]//k co phan tu chung vs ca 2 tap hop tren
foods.isDisjoint(with: animals)//true vi k phan tu nao chung


////-----------------4. Kieu DICTIONARY-------------------////

//khoi tao
var buzz:Dictionary=[1:"eva",2:"olivia"]
var info:Dictionary=["name":"Trinh","dob":"13/02"]

//lay gt
print(buzz[1]!)//eva
print(info["name"]!)

//thay doi gia tri 2 cach
//cach1
buzz[1]="Hazel"
print(buzz[1]!)//Hazel

//cach2
buzz.updateValue("Parker", forKey: 1)
print(buzz[1]!)

//check rong
if buzz.isEmpty{
    print("4.dic buzz Rong")
}else{
    print("4.K rong")//in
}

//su dung tuple
for (_key,_value) in buzz{
    print("4.\(_key)-\(_value)")//4.2-olivia   4.1-Parker
    
}


////-----------------5. FUNCTION-------------------////


func sumab(a:Int,b:Int)->Int{
    return a+b
}
print("10+11=\(sumab(a:10,b:11))")

func calculate(a:Double,b:Double)->(c:Double,d:Double){
    return (a + b*a , a*a)
}
print(calculate(a: 2, b: 5))

//dung "_" để không cần điền tên biến
func calculate2(_ a:Double,_ b:Double=13)->(c:Double,d:Double){
    return (b*a , a+b)
}
print(calculate2(2, 5))
print(calculate2(2))//nếu không điền vào gt của b thì tự động lấy giá trị mặc định là 13

//tham chieu ->dung "inout"
func thamchieu(_ s : inout String){
    s="timeout"
}
var bien_s="no"
thamchieu(&bien_s)
print(bien_s)
//hàm trong hàm, khi goi ham cha thi all ham con deu duoc goi
func ab(){
    func a(){
        print("ham a")
    }
    func b(){
        print("hàm b")
    }
}
print(ab())

////-----------------5. closures-------------------////

//Closures giống như con trỏ hàm
//Co ban=> Nang cao doc them
var arr_closure=["3a","1b","2c"]
var sorted=arr_closure.sorted(by:
{
    s1,s2->Bool in return s1<s2
})
print("khi da sx:\(sorted)")//khi da sx:["1b", "2c", "3a"]

////-----------------6. Enum + Switch-------------------////
enum Level{
    case low
    case medium
    case high
    //case low, medium,high
}

//gan gtri:2cach
var myLevel=Level.high
var mylevel2:Level = .medium
switch mylevel2{
case .low:
    print("low level")
case .medium:
    print("medium level")
case .high:
    print("high level")
default:
    print("not")
}

//su dung tuple
enum device{
    case appleWatch(String,Int)
    case iPhone(Double,String)
}
var iPhoneX:device = .iPhone(29.990,"Tai tho")
switch iPhoneX {
case let .iPhone(gia,mo_ta)://dat ten cho 2 gia tri o tren
    print("gia: \(gia), mo ta: \(mo_ta)")
default:
    print("timeout")
}
////-----------------7. Struct_basic-------------------////

struct Shape{
    var width:Float=0.0
    var height=0.0
}

//khoi tao
//cach1
var shape1=Shape()

//cach2
var aShape=Shape(width: 1, height: 2)

print(aShape.width)//0
aShape.width=10
print(aShape.width)//10

////-----------------8. Class-------------------////
class User{
    var name:String?
    var age:Int=0
}
var user1=User()

////-----------------9. Extension-------------------////
//**Cho ra giá trị chứ không dùng giá trị
//Can dung Extension trong truong 5 hop:
//1. Là cách thêm các thuộc tính, tính toán vào lớp có sẳn mà không cần kế thừa, vì có khi k biết được họ viết gì trong lớp đó, chỉ biết lớp đó có những thuộc tính hay phương thức đó thôi (tên)
//2. Cung cấp thêm một số cách để khởi tạo đối tượng (Initializer).
//3. Đáp ứng thêm một hoặc nhiều giao thức (Adapt Protocol).
//4. Thêm các thuộc tính tính toán (Computed properties).
//5. Mở rộng giao thức (Protocol) – New in Swift 2.0.


/// 1. Thêm phương thức vào một class có sẵn (basic)
extension Double {
    var m : Double {
        return self
    }
    var km : Double {
        return self * 1000.0
    }
    var cm : Double {
        return self / 100.0
    }
    var mm : Double {
        return self / 1000.0
    }
}

var Convert_m = 0.1.km + 1.m + 10.0.cm + 100.mm // 0.1 kiểu Double và ta gọi thuộc tính của nó = '.'


/// 2. Cung cấp thêm một số cách để khởi tạo đối tượng(Extension init)
//VD1 - basic:

struct Point11{
    var x,y: Double
}
extension Point: Point11 {
    init(xValue:Double, yValue: Double){
        self.x = xValue
        self.y = y Value
    }
}


///3. Extend a static method
//Đoạn code sau giúp ta khởi tạo một đối tượng UIColor, từ bốn chỉ số Red – Green – Blue – Alpha:
let color = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
//--->Dai dong  mà lại không hỗ trợ mã Hexa nữa
//===>Viet them vao:
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}

let color1 = UIColor(hex: 0x112233)
let color2 = UIColor(red: 200, green: 100, blue: 100)


///4. Đáp ứng thêm một hoặc nhiều giao thức (Protocol)
//hai protocol thông dụng của UITableView  chứ, đó là UITableViewDataSource  và UITableViewDelegate.
Theo cách bình thường, ta sẽ viết như sau:
class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
//Giờ thử dùng Extensions để giải quyết:
class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

///5. Thêm các thuộc tính tính toán (Computed properties)

//Computed Properties là những thuộc tính được tạo thành từ function, function sẽ được gọi khi ta access vào property đó.
//Trong Swift, ta sử dụng {get set}  để tạo Computed properties. Ví dụ:

extension Int {
    var double: Int {
        get {
            return self * 2
        }
    }
}

//Chúng ta vừa thêm một Computed Property kiểu int: lấy giá trị chính nó nhân cho 2:
let number: Int = 20 // 20
print(number.double) // "40"

///Mở rộng giao thức

//Từ phiên bản 2.0, Swift Extensions có thêm “sức mạnh” mới… đó là mở rộng được cả Protocol.
//Giờ chúng ta lấy một common Protocol CustomStringConvertible để làm “chuột bạch”:
extension CustomStringConvertible {
    func lol() -> String {
        return "\(self) LOL!!!"
    }
}

//test
let string: String = "Hello"
print(string.lol())             // "Hello LOL!!!"

let number: Int = 10
print(number.lol())            // "10 LOL!!!"
////-----------------10. If let và guard-------------------////

//Phương thức giúp bạn nắm rõ và sử dụng Optional trong Swift thành thạo hơn.


////IF LET: Nếu yIL là có giá trị không nil, gán nó vào xIL và thực thi print(), điều này đảm bảo rằng xIL là một đối tượng không nil.
var xIL = 1
var yIL: Int?
if let xIL = yIL { // Khởi tạo một đối tượng x = đối tượng optional y
    print(xIL) // Sử dụng biến non-optional x
}

////GUARD: Cấu trúc này hơi ngược một chút so với if let, nếu y không nil, chúng ta gán nó vào x, còn nếu không, khối lệnh else sẽ thực thi, ở dưới cùng, chúng ta làm những gì mình muốn với x đã được đảm bảo là không nil.

guard let xG = yG else { // Where y is Optional
    print(yG) // Do something with y as nil
}
// Do something with non-Optional x

////-----------------11. Initialization (khởi tạo) -------------------////

//1. Designated Initializer: là việc khởi tạo theo cách thông thường nhất, trong hàm khởi tạo chúng ta gán giá trị ban đầu cho toàn bộ các non-optional
//2. Convenience initializer của class là dạng hàm khởi tạo mà bên trong hàm này, chúng ta gọi đến 1 hàm khởi tạo khác của class

class Person {
    var name: String
    var age: Int
    
    // Designated Initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // Convenience Initializer
    convenience init(name: String, yearOfBirth: Int) {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        ////self.name = "ABC" -> error
        self.init(name: name, age: year - yearOfBirth)
    }
}

//3. Có thể sử dụng optional init hoặc throw exception để xử lý vấn đề khởi tạo lỗi cho Class

class Person2{
    var name: String
    var age: Int
    
    // Designated Initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // Convenience Initializer with throws exception
    convenience init(name: String, andAge age: Int) throws {
        if name.isEmpty {
            throw InvalidPersonError.EmptyName
        }
        
        if age < 0 {
            throw InvalidPersonError.InvalidAge
        }
        
        self.init(name: name, age: age)
    }
    
    // Convenience Initializer with optional
    convenience init?(name: String, withAge age: Int) {
        guard !name.isEmpty && age >= 0 else {
            return nil
        }
        self.init(name: name, age: age)
    }
}
do {
    let belly = try Person(name: "belly", andAge: -1)
} catch InvalidPersonError.EmptyName {
    print("name is empty")
} catch InvalidPersonError.InvalidAge {
    print("age is invalid")
}

//Khởi tạo với subclass
//Viet ham khoi tao -> LOI
//class Employee: Person {
//    var employeeCode: String
//}
//a. Xét trường hợp fix lỗi thứ 1, chúng ta gán giá trị mặc định cho property
class Employee: Person {
    var employeeCode: String = "abcde"
}

//b. Xét trường hợp fix lỗi thứ 2, chúng ta viết thêm hàm init cho class này
//Để viết hàm init dạng designated initializer cho subclass, chúng ta phải viết như sau
//Cần gán giá trị cho employeeCode trước và sau đó gọi hàm super.init(name:,age:) để hàm khởi tạo của superclass gán giá trị cho các property còn lại
init(name: String, age: Int, employeeCode: String) {
    self.employeeCode = employeeCode
    super.init(name: name, age: age)
}

//LOI khi thuc hien 2 truong hop sau:
//TH1: "error: property 'self.employeeCode' not initialized at super.init call"
//init(name: String, age: Int, employeeCode: String) {
//    super.init(name: name, age: age)
//    self.employeeCode = employeeCode
//}

//TH2:error: use of 'self' in property access 'name' before super.init initializes self
//init(name: String, age: Int, employeeCode: String) {
//    self.employeeCode = employeeCode
//    self.name = name
//    self.age = age
//}

///=====>Tóm lại, khi viết hàm khởi tạo cho subclass, chúng ta bắt buộc phải gán giá trị cho các property của subclass, rồi sau đó gọi hàm khởi tạo của superclass để gán nốt giá trị cho các property thừa kế từ superclass.

////-----------------12.ALL KEYWORDS IN SWIFT -------------------////
////(Copy & edit from Internet)

////Declaration Keywords
///Associatedtype: Cho phép tạo 1 tên bất kỳ cho 1 loại biến trong khai báo của 1 protocol. Biến này được qui định là loại nào khi protocol đó được adopt.

protocol Entertainment
{
    associatedtype MediaType
}
class Foo : Entertainment
{
    typealias MediaType = String // Bất cứ loại nào đều được
}
///class :
//là thành phần không thể thiếu trong mọi ứng dụng, chúng giúp chúng ta tổ chức và quản lý code thành những khối, nó có 1 số điểm khác struct như sau:
//Tính kế thừa.
//Cho phép ép kiểu hoặc check kiểu lúc chương trình chạy runtime.
//Tính huỷ: cho phép instance của một class phải phóng bất cứ tài nguyên nào mà nó đã gán, hàm huỷ được gọi ngay trước khi instance của một class được giải phóng (trả lại bộ nhớ đã được cấp phát tới ram).
//Class là kiểu tham chiếu, và chính vì nó là kiểu tham chiếu nên nó có thêm toán tử đồng nhất thức (===), có nghĩa rằng hai biến hoặc hằng của kiểu class tham chiếu tới chính xác cùng một instance của class.

class Person1
{
    var name:String
    var age:Int
    var gender:String
}


///deinit: được gọi ngay khi instance của 1 class được giải phóng vùng nhớ trong vùng nhớ heap.
class Person2
{
    var name:String
    var age:Int
    var gender:String
    deinit
    {
        // Giải phóng vùng nhớ trong heap.
    }
}


///enum : Giúp định nghĩa 1 tập hợp có số phần tử cố định và được liệt kê sẵn. Enum là kiểu tham trị.
enum Gender
{
    case male
    case female
}


///extension : Cho phép mở rộng thêm hàm từ 1 class hoặc struct hoặc enum hoặc protocol.
class Person3
{
    var name:String = ""
    var age:Int = 0
    var gender:String = ""
}
extension Person3
{
    func printInfo()
    {
        print("My name is \(name), I'm \(age) years old and I'm a \(gender).")
    }
}


///fileprivate : là 1 access control giới hạn trong 1 file, thường dùng cho extension.
class Person4
{
    fileprivate var jobTitle:String = ""
}
extension Person4
{
    // nếu mà khai báo bằng private là compiler báo lỗi
    func printJobTitle()
    {
        print("My job is \(jobTitle)")
    }
}


///func : cho phép khai báo 1 hàm.
func addNumbers(num1:Int, num2:Int) -> Int
{
    return num1+num2
}


///import : Cho phép nhúng 1 framework hoặc 1 module khác vào trong module hiện có.

import UIKit
//All of UIKit's code is now available
class Foo {}
init : là quá trình chuẩn bị một instance của class, struct, hoặc enum để sử dụng.
class Person
{
    init()
    {
        //Set default values, prep for use, etc.
    }
}


///inout : Tham số chỉ tồn tại trong phạm vi của hàm, nên sử dụng inout sẽ giúp thay đổi giá trị của một tham số của hàm và sự thay đổi đó vẫn còn khi hàm kết thúc. Khi gọi hàm phải đặt dấu (&) ngay trước tên biến để cho trình biên dịch biết biến đó có thể thay dổi trong hàm.
func swapInts(inout a: Int, inout _ b:Int) {
    let temp = a
    a = b
    b = temp
}


///internal : Một access control cho phép sử dụng trong 1 module, không ghi gì thì mặc định là internal đó.
class Person
{
    internal var jobTitle:String = ""
}
let aPerson = Person()
aPerson.jobTitle = "This can set anywhere in the application"


///let : định nghĩa 1 biến bằng let là sau này không có thay đổi giá trị nó được đó.
let constantString = "This cannot be mutated going forward"


///open : Một access control cho phép object được sử dụng ở ngoài module khác . Thường viết bằng open khi tạo ra các framework.
open var foo: String?
operator : các toán tử cho phép chúng ta kiểm tra, thay đổi hoặc kết hợp các giá trị lại với nhau.
let foo = 5
let anotherFoo = -foo

let box = 5 + 3
let didPassCheckAll = didPassCheckOne && didPassCheckTwo


/// Toán tử 3 ngôi giúp code ngắn hơn
let isLegalDrinkingAgeInUS = age >= 21 ? true : false
private : Một access control cho phép chỉ xài trong 1 scope.
class Person
{
    private var jobTitle = ""
}
extension Person
{
    // Chỗ này sẽ compile lỗi
    func printJobTitle()
    {
        print("My job is \(jobTitle)")
    }
}


///protocol : định nghĩa các giao thức, class, struct hay enum mà adopt procotol này thì phải theo chuẩn của nó.
protocol Blog
{
    var wordCount:Int { get set }
    func printReaderStats()
}
class TTIDGPost : Blog
{
    var wordCount: Int
    
    init(wordCount: Int)
    {
        self.wordCount = wordCount
    }
    func printReaderStats()
    {
        //Print out some stats on the post
    }
}


///public : Một access control cho phép object sử dụng ở tất cả các file trong cùng 1 module.
public var foo: String?


///static : biến nào mà được định nghĩa bằng từ khoá static thì nó tồn tại suốt trong 1 chương trình và không bị huỷ, ngoài ra sử dụng static thì ta có thể thao tác biến hoặc hàm bằng class hoặc struct hoặc enum đó luôn.
class Person
{
    var jobTitle: String?
    static func assignRandomName(_ aPerson: Person)
    {
        aPerson.jobTitle = "Some random job"
    }
}
let somePerson = Person()
Person.assignRandomName(somePerson)
//somePerson.jobTitle is now "Some random job"


///struct : cũng là thành phần không thể thiếu trong mọi ứng dụng như class, chúng giúp chúng ta tổ chức và quản lý code thành những khối, nó có 1 số điểm khác class như sau:
//Không có tính kế thừa.
//Là kiểu tham trị.
//Không có tính huỷ.
struct Person
{
    var name: String
    var age: Int
    var gender: String
}


///subscript : cho phép truy xuất đến 1 thành viên nằm trong một collection, list hoặc sequence.
var postMetrics = ["Likes":422, "ReadPercentage":0.58, "Views":3409]
let postLikes = postMetrics["Likes"]


///typealias : Cho phép đặt 1 tên khác của 1 kiểu sẵn có.
typealias JSONDictionary = [String: AnyObject]
func parseJSON(_ deserializedData: JSONDictionary){}


///var : định nghĩa 1 biến có thể thay đổi được giá trị.
var mutableString = ""
mutableString = "Mutated"
Keywords in Statements


///break : kết thúc chương trình trong loop, if hoặc switch
for idx in 0...3
{
    if idx % 2 == 0
    {
        break
    }
}


///case : một trường hợp trong câu lệnh switch.
let box = 1
switch box
{
case 0:
    print("Box equals 0")
case 1:
    print("Box equals 1")
default:
    print("Box doesn't equal 0 or 1")
}


///continue : trong vòng lặp nếu gặp continue thì nó sẽ bỏ qua trường hợp đó (ở đây trong câu lệnh if) rồi tiếp tục duyệt tiếp.
for idx in 0...3
{
    if idx % 2 == 0
    {
        continue // Thoát khúc này thôi
    }
    
    print("This code never fires on even numbers") // Vẫn in ra nhé
}


///default : xét case từ trên xuống mà ko thấy cái nào dính thì bay vào default.
let box = 1
switch box
{
case 0:
    print("Box equals 0")
case 1:
    print("Box equals 1") // In mỗi thằg này ra thôi
default:
    print("Covers any scenario that doesn't get addressed above.")
}


///defer : sử dụng khi muốn đảm bảo thực thi 1 đoạn code nào đó ngay khi hàm kết thúc.
func test()
{
    defer
    {
        print("2") // thằng này print sau
    }
    print("1") // thằng này print trước
}


///do : thực thi đoạn chương trình nào đó có khả năng xảy ra lỗi .
do
{
    try expression
    //statements
}
catch someError ex
{
    //Handle error
}


///else : Nếu không phải thằng A thì là thằng B thôi.
if val > 1
{
    print("val is greater than 1")
}
else
{
    print("val is not greater than 1")
}


///fallthrough : xét trên xuống, nếu khớp 1 case nào đó vẫn tiếp tục xét tiếp 1 case liền kề
let box = 0
switch box
{
case 0:
    print(0) // In ra 0
    fallthrough
case 1:
    print(1) // In ra 1
case 2:
    print(2) // Không có được in ra
default:
    print("default")
}


///for : giúp lặp các phần tử trong 1 sequence hoặc array hoặc các kí tự trong 1 String.
for _ in 0..<3 { print ("This prints 3 times") }
guard : đảm bảo điều kiện nào đó đúng, vừa có thể unwrap biến optional. Thật ra xài if let cũng được, nhưng xài guard đỡ phải lồng vào trong 1 scope nhìn rối mắt.
private func printRecordFromLastName(userLastName: String?)
{
    guard let name = userLastName, userLastName != "Null" else
    {
        //Sorry Bill Null, find a new job
        return
    }
    //Party on
    print(dataStore.findByLastName(name))
}


///if : đảm bảo 1 hoặc nhiều điều kiện khi thực hiện 1 hoặc nhiều câu lệnh nào đó.
if 1 > 2
{
    print("This will never execute")
}


///in : đi chung với for ở trên
for _ in 0..<3 { print ("This prints 3 times") }


///repeat : Y chang do while trong C/C++. Thực thi đoạn chương trình ít nhất 1 lần trước khi lặp qua điều kiện
repeat
{
    print("Always executes at least once before the condition is considered")
}
    while 1 > 2


///return : thoát khỏi hàm luôn, và có thể trả về giá trị nào đó tuỳ chúng ta khai báo.
func doNothing()
{
    return //Immediately leaves the context
    let anInt = 0
    print("This never prints \(anInt)")
}
//và
func returnName() -> String?
{
    return self.userName //Returns the value of userName
}


///switch : xét và so sánh giá trị xem nó match với case nào, hoặc thích thì dùng if + else if + else.
let box = 1
switch box
{
case 0:
    print("Box equals 0")
    fallthrough
case 1:
    print("Box equals 0 or 1")
default:
    print("Box doesn't equal 0 or 1")
}


///where : dùng để ghép với for kiểm tra xem có đúng điều kiện không, hoặc dùng cho 1 loại generic type phải conform đúng protocol nào đó.
protocol Nameable
{
    var name: String {get set}
}
func createdFormattedName<T: Nameable>(_ namedEntity: T) -> String where T: Equatable
{
    // Chỉ có thực thể nào mà vừa conform Nameable và Equatable thì mới dùng được hàm này
    return "This things name is " + namedEntity.name
}
//và
for i in 0…3 where i % 2 == 0
{
    print(i) //Prints 0 and 2
}


///while : loop điều kiện nào đó cho tới khi nó sai thì thôi.
while foo != bar
{
    print("Keeps going until the foo == bar")
}


////Expressions and Types Keywords

///Any : để hiện diện cho bất kỳ loại thuộc tính nào của đối tượng, bao gồm cả hàm.
var anything = [Any]()
anything.append("Any Swift type can be added")
anything.append(0)
anything.append({(foo: String) -> String in "Passed in \(foo)"})


///as : dùng để ép kiểu.
var anything = [Any]()
anything.append("Any Swift type can be added")
anything.append(0)
anything.append({(foo: String) -> String in "Passed in \(foo)" })
let intInstance = anything[1] as? Int
//hoặc
var anything = [Any]()
anything.append("Any Swift type can be added")
anything.append(0)
anything.append({(foo: String) -> String in "Passed in \(foo)" })
for thing in anything
{
    switch thing
    {
    case 0 as Int:
        print("It's zero and an Int type")
    case let someInt as Int:
        print("It's an Int that's not zero but \(someInt)")
    default:
        print("Who knows what it is")
    }
}


///catch : nếu trong mệnh đề clause xảy ra lỗi, thì catch sẽ xử lý lỗi đó, ta có thể catch nhiều trường hợp khác nhau như trong ví dụ dưới.
do
{
    try haveAWeekend(4)
}
catch WeekendError.Overtime(let hoursWorked)
{
    print(“You worked \(hoursWorked) more than you should have”)
}
catch WeekendError.WorkAllWeekend
{
    print(“You worked 48 hours :-0“)
}
catch
{
    print(“Gulping the weekend exception”)
}


///false : biến kiểu Bool, ko phải là true.
let alwaysFalse = false
let alwaysTrue = true
if alwaysFalse { print("Won't print, alwaysFalse is false 😉")}


///is : kiểm tra xem có phải loại subclass nào đó hay không.
class Person {}
class Programmer : Person {}
class Nurse : Person {}
let people = [Programmer(), Nurse()]
for aPerson in people
{
    if aPerson is Programmer
    {
        print("This person is a dev")
    }
    else if aPerson is Nurse
    {
        print("This person is a nurse")
    }
}


///nil : Represents a stateless value for any type in Swift. *Different from Objective-C’s nil, which is a pointer to a nonexistent object. (chỗ này mình không dịch)
class Person{}
struct Place{}
//Literally any Swift type or instance can be nil
var statelessPerson: Person? = nil
var statelessPlace: Place? = nil
var statelessInt: Int? = nil
var statelessString: String? = nil


///rethrows : 1 hàm ném ra 1 error nếu 1 tham số trong hàm ném ra 1 error.
func networkCall(onComplete:() throws -> Void) rethrows
{
    do
    {
        try onComplete()
    }
    catch
    {
        throw SomeError.error
    }
}


///super : là một biến tham chiếu mà được sử dụng để tham chiếu đến đối tượng lớp cha gần nhất.
class Person
{
    func printName()
    {
        print("Printing a name. ")
    }
}
class Programmer : Person
{
    override func printName()
    {
        super.printName() // Super là Person đó
        print("Hello World!")
    }
}
let aDev = Programmer()
aDev.printName() //"Printing a name. Hello World!"


///self : là thực thể của loại mà mình đang xài đó ( có thể là class, struct hoặc enum)
class Person
{
    func printSelf()
    {
        print("This is me: \(self)")
    }
}
let aPerson = Person()
aPerson.printSelf() //"This is me: Person"


///Self : Xài trong protocol, Self chính là class, struct hoặc enum nào đó conform protocol kia.
protocol Printable
{
    func printTypeTwice(otherMe:Self)
}
struct Foo : Printable
{
    func printTypeTwice(otherMe: Foo)
    {
        print("I am me plus \(otherMe)")
    }
}
let aFoo = Foo()
let anotherFoo = Foo()
aFoo.printTypeTwice(otherMe: anotherFoo) //I am me plus Foo()


///throw : ném ra 1 error từ 1 hàm.
enum WeekendError: Error
{
    case Overtime
    case WorkAllWeekend
}
func workOvertime () throws
{
    throw WeekendError.Overtime
}


///throws : Chỉ ra rằng 1 hàm có thể ném ra 1 lỗi nào đó.
enum WeekendError: Error
{
    case Overtime
    case WorkAllWeekend
}
func workOvertime () throws
{
    throw WeekendError.Overtime
}
//"throws" indicates in the function's signature that I need use try, try? or try!
try workOvertime()
///true giá trị true trong kiểu Bool.
let alwaysFalse = false
let alwaysTrue = true
if alwaysTrue { print("Always prints")}


///try : Khi gọi hàm thì ta phải thêm try hoặc try? hoặc try! trước hàm đó.
let aResult = try dangerousFunction() //có lỗi là phải catch lại
let aResult = try! dangerousFunction() //có lỗi là crash luôn
if let aResult = try? dangerousFunction() //Unwrap 1 giá trị optional từ hàm này trả về


////Keywords Using Patterns

///_ : Nói chung là bỏ qua giá trị khi nó match dc đó.
for _ in 0..<3
{
    print("Just loop 3 times, index has no meaning")
}
//hoặc
let _ = Singleton() //Ignore value or unused variable


////Keywords Using #

///#available : Kiểm tra điều kiện lúc runtime, ví dụ như kiểm tra version ios.
if #available(iOS 10, *)
{
    print("iOS 10 APIs are available")
}


///#colorLiteral : ra bộ chọn màu.
let aColor = # colorLiteral //Brings up color picker


///#column : Biết mình đang ở cột nào.
class Person
{
    func printInfo()
    {
        print("Some person info - on column \(#column)")
    }
}
let aPerson = Person()
aPerson.printInfo() //Some person info - on column 53


///#if #elseif #else #endif : Kiểm tra điều kiện như là đang xài hệ điều hành nào, version bao nhiêu…
#if os(iOS)
print("Compiled for an iOS device")
#elseif os(macOS)
print("Compiled on a mac computer")
#endif


///#file : Trả về tên file chứa nó.
class Person
{
    func printInfo()
    {
        print("Some person info - inside file \(#file)")
    }
}
let aPerson = Person()
aPerson.printInfo() //Some person info - inside file /*file path to the Playground file I wrote it in*/


///#function :trả về tên của function chứa nó, trong getter, setter thì sẽ trả về tên thuộc tính, trong 1 số hàm như init hoặc subscript thì sẽ trả về tên của từ khoá đó, nếu đặt ở ngay đầu file thì sẽ trả về tên của module hiện tại.
class Person
{
    func printInfo()
    {
        print("Some person info - inside function \(#function)")
    }
}
let aPerson = Person()
aPerson.printInfo() //Some person info - inside function printInfo()


///#imageLiteral : show nguyên kho hình lên cho mình chọn.
let anImage = # imageLiteral //Brings up a picker to select an image inside the playground file


///#line : Trả về số dòng hiện tại.

class Person
{
    func printInfo()
    {
        print("Some person info - on line number \(#line)")
    }
}
let aPerson = Person()
aPerson.printInfo() //Some person info - on line number 5


///#selector : nói chung là đảm bảo hàm nào đó tồn tại và gắn vào 1 action nào đó.
//Static checking occurs to make sure doAnObjCMethod exists
control.sendAction(#selector(doAnObjCMethod), to: target, forEvent: event)


///#sourceLocation : gọi dòng này xong là reset số dòng với tên file, không còn đúng như trước lúc gọi.
#sourceLocation(file:"foo.swift", line:6)
//Reports new values
print(#file)
print(#line)
//This resets the source code location back to the default values numbering and filename
#sourceLocation()
print(#file)
print(#line)

////Keywords For Specific Context(s)
///convenience : đúng theo nghĩa của nó là tiện lợi, chạy dựa trên designated initializer, mình có viết 1 bài về nó ở đây.
class Person
{
    var name:String
    init(_ name:String)
    {
        self.name = name
    }
    convenience init()
    {
        self.init("No Name")
    }
}
let me = Person()
print(me.name)//Prints "No Name"


///dynamic : Nói chung là chạy bằng Objective-C runtime và Swift runtime sẽ cho ra kết quả khác nhau, thêm dynamic vào thì coi như nó chạy bằng Objective-C runtime.
class Person
{
    //Implicitly has the "objc" attribute now too
    //This is helpful for interop with libs or
    //Frameworks that rely on or are built
    //Around Obj-C "magic" (i.e. some KVO/KVC/Swizzling)
    dynamic var name:String?
}


///didSet : sau khi gán xong thì nó sẽ thực hiện câu lệnh bên trong didSet
var data = [1,2,3]
{
    didSet
    {
        tableView.reloadData()
    }
}


///final : Ngăn không cho kế thừa nữa.
final class Person {}
class Programmer : Person {} //Compile time error


///get : dùng để trả về giá trị 1 giá trị nào đó.
class Person
{
    var name:String
    {
        get { return self.name }
        set { self.name = newValue}
    }
    var indirectSetName:String
    {
        get
        {
            if let aFullTitle = self.fullTitle
            {
                return aFullTitle
            }
            return ""
        }
        set (newTitle)
        {
            //If newTitle was absent, newValue could be used
            self.fullTitle = "\(self.name) :\(newTitle)"
        }
    }
}


///indirect : Chỉ ra enum có 1 case khác liên quan tới giá trị của 1 hoặc nhiều case trong enum đó
indirect enum Entertainment
{
    case eventType(String)
    case oneEvent(Entertainment)
    case twoEvents(Entertainment, Entertainment)
}
let dinner = Entertainment.eventType("Dinner")
let movie = Entertainment.eventType("Movie")
let dateNight = Entertainment.twoEvents(dinner, movie)


///lazy : biến nào có lazy thì nó chỉ được tính toán khi nó được gọi ra, giúp tiết kiệm bộ nhớ hơn.
class Person
{
    lazy var personalityTraits = {
        //Some crazy expensive database  hit
        return ["Nice", "Funny"]
    }()
}
let aPerson = Person()
aPerson.personalityTraits //Database hit only happens now once it's accessed for the first time


///mutating : Cho phép thay đổi giá trị của thuộc tính của struct hoặc enum.
struct Person
{
    var job = ""
    mutating func assignJob(newJob:String)
    {
        self = Person(job: newJob)
    }
}
var aPerson = Person()
aPerson.job //""
aPerson.assignJob(newJob: "iOS Engineer at Buffer")
aPerson.job //iOS Engineer at Buffer


///nonmutating : Chỉ ra rằng hàm setter không thay đổi được instance chứa nó.
enum Paygrade
{
    case Junior, Middle, Senior, Master
    var experiencePay:String?
    {
        get
        {
            database.payForGrade(String(describing:self))
        }
        nonmutating set
        {
            if let newPay = newValue
            {
                database.editPayForGrade(String(describing:self), newSalary:newPay)
            }
        }
    }
}
let currentPay = Paygrade.Middle
//Updates Middle range pay to 45k, but doesn't mutate experiencePay
currentPay.experiencePay = "$45,000"


///optional : Sử dụng để khai báo hàm optional trong protocol.
@objc protocol Foo
{
    func requiredFunction()
    @objc optional func optionalFunction()
}
class Person : Foo
{
    func requiredFunction()
    {
        print("Conformance is now valid")
    }
}


///override : Chỉ ra rằng lớp con đang ghi đè lên biến hoặc hàm của lớp cha
class Person
{
    func printInfo()
    {
        print("I'm just a person!")
    }
}
class Programmer : Person
{
    override func printInfo()
    {
        print("I'm a person who is a dev!")
    }
}
let aPerson = Person()
let aDev = Programmer()
aPerson.printInfo() //I'm just a person!
aDev.printInfo() //I'm a person who is a dev!


///required : đảm bảo rằng mọi lớp con phải thực thi hàm khởi tạo cho trước.
class Person
{
    var name:String?
    required init(_ name:String)
    {
        self.name = name
    }
}
class Programmer : Person
{
    //Excluding this init(name:String) would be a compiler error
    required init(_ name: String)
    {
        super.init(name)
    }
}


///set : trong hàm set có thể làm gì thì làm, set giá trị cho chính property chứa nó hoặc property khác cũng được.
class Person
{
    var name:String
    {
        get { return self.name }
        set { self.name = newValue}
    }
    var indirectSetName:String
    {
        get
        {
            if let aFullTitle = self.fullTitle
            {
                return aFullTitle
            }
            return ""
        }
        set (newTitle)
        {
            //If newTitle was absent, newValue could be used
            self.fullTitle = "\(self.name) :\(newTitle)"
        }
    }
}


///Type : có thể là class type, struct type, enum type hoặc protocol type.
class Person {}
class Programmer : Person {}
let aDev:Programmer.Type = Programmer.self


///unowned : Cho phép 1 instance tham chiếu tới 1 instance khác mà không làm tăng reference count, đảm bảo rằng instance đã tham chiếu tới có lifetime bằng hoặc lâu hơn chính nó.
class Person
{
    var occupation:Job?
}
//Khi nào người mất thì job mới mất
class Job
{
    unowned let employee:Person
    init(with employee:Person)
    {
        self.employee = employee
    }
}


///weak : Cho phép 1 instance tham chiếu tới 1 instance khác mà không làm tăng reference count, nhưng instance đã tham chiếu kia có lifetime ngắn hơn (có thể bị huỷ trước)
class Person
{
    var residence:House?
}
class House
{
    weak var occupant:Person?
}
var me:Person? = Person()
var myHome:House? = House()
me!.residence = myHome
myHome!.occupant = me
me = nil
myHome!.occupant //Is now nil


///willSet : bên trên có cái didSet là khi nào gán xong mới chạy mấy câu lệnh bên trong, còn willSet thì được gọi ngay trước khi biến được gán đâu đó. Nó có newValue là giá trị sẽ được gán đó.
class Person
{
    var name:String?
    {
        willSet(newValue) {print("I've got a new name, it's \(newValue)!")}
    }
}
let aPerson = Person()
aPerson.name = "Jordan" //Prints out "I've got a new name, it's Jordan!" right before name is assigned to













