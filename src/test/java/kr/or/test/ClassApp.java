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
	}

}

class Circle {
	int r; //멤버변수, 반지름
	public Circle(int a) {
		r = a;
	}
	public double getArea() {
		return r*r*3.14; // 원의 넓이 반환	
	}
}
