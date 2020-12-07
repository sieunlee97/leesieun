package kr.or.test;
//오리지널 자바 프로그램 형식 : 자바이론공부 -> 스프링 웹프로그램과는 형식이 다르다.
public class ClassApp {

	public static void main(String[] args) {
		// 이 클래스의 진입 메소드 main 
		Circle c = new Circle(5); //c라는 Object(=인스턴스변수,클래스변수)생성
		// Circle 클래스를 c 이름으로 prefix해서 사용하는 것.
		// new 키워드는 메모리에 프로그램 실행공간을 새로 할당한다는 이야기
		double print_result = c.getArea();
		System.out.println(print_result);
		
		Employee employee = new Employee();
		Salesman salesman = new Salesman();
		Development development = new Development();
		
		employee.doJob();
		salesman.doJob();
		development.doJob();

		GraphicObject triangle = new Triangle();
		triangle.draw();
	}
}

// 메소드 오버로드 (한개의 클래스에서 메소드이름은 고유값이라 중복해서 사용 불가능. 단, 매개변수(인자값)가 다르면 가능.
// 따라서, 메소드 이름이 같으나 매개변수가 다르게 사용)
// 추상클래스에 대한 연습
// 추상클래스 또는 인터페이스를 사용하는 목적은 두꺼운 책에서 목차를 만드는 것과 똑같은 역할.
abstract class GraphicObject {
	int x,y;
	abstract void draw(); // 명세표만 있고 구현 내용이 없는 (인터페이스) 추상메소드 선언
	// 잭에서 목차만 있고, 내용이 없는 구조. 내용은 별도의 클래스에 있음.
	// draw()에 ctrl + implementation -> 해당하는 곳으로 이동.
}
class Triangle extends GraphicObject {
	// 메소드 오버라이드(메소드 이름이 같은 것을 상속관계에서 실행)
	@Override
	void draw() {
		System.out.println("  *");		
		System.out.println(" * * ");
		System.out.println("*****");
	}
}

// 클래스 상속
class Employee { // 회사의 직원들 
	int nSalary; // 회사직원 봉급 멤버변수
	String szDept; // 회사직원의 부서명 멤버변수
	public void doJob() {
		szDept="모든 직원";
		System.out.println("환영합니다 "+szDept+" 여러분");
	}
}
class Salesman extends Employee {
	public Salesman() { // 클래스명과 같은 메소드를 생성자 메소드라고 한다.
		szDept = "판매부서"; // 부모클래스에서 선언한 멤버변수 szDept를 자식 클래스에서도 사용 가능
	}
	public void doJob() {
		System.out.println("환영합니다 "+szDept+"입니다.");
	}
}
class Development extends Employee {
	public Development() {
		szDept="개발부서";
	}
		public void doJob() {
			System.out.println("환영합니다 "+ szDept +"입니다.");
		}
}

//----------------------------------------------------------------------
class Circle {
	int r; //멤버변수, 반지름
	public Circle(int a) {
		r = a;
	}
	public double getArea() {
		return r*r*3.14; // 원의 넓이 반환	
	}
}
