package kr.or.test;

public class InterfaceApp {

	public static void main(String[] args) {
		// 자바프로그램은 항상 main() 진입점에서 실행한다. 단, 웹프로그램은 해당 안 됨.
		AllCalc allCalc = new AllCalc(); // 실행 오브젝트 변수 allCalc 생성
		allCalc.add(9, 4); //메소드를 호출할 때, 매개변수가 고정되지 않고,
		allCalc.sub(5, 2); //동적으로 묶이는 방식을 동적바인딩이라고 한다.
		allCalc.mul(2, 21);
		allCalc.div(5, 5);
		
	}

}

//인터페이스 실습(아래)
// 명세표(메소드명)만 있고 구현내용 없는 구조
interface CalcAddSub {
	void add(double dx, double dy);
	void sub(double dx, double dy);
}
interface CalcMulDiv extends CalcAddSub {
	void mul(double dx, double dy);
	void div(double dx, double dy);
}
class AllCalc implements CalcAddSub, CalcMulDiv {
//implement : 구현하다. 따라서, CalcAddSub와 CalcMulDiv를 이용해서 구현한다.

	@Override
	public void mul(double dx, double dy) {
		// 구현내용
		System.out.println("곱하기 : " + (dx*dy));
	}

	@Override
	public void div(double dx, double dy) {
		// 구현내용
		System.out.println("나누기 : " + (dx/dy));
	}

	@Override
	public void add(double dx, double dy) {
		// 구현내용
		System.out.println("더하기 : " + (dx+dy));
	}

	@Override
	public void sub(double dx, double dy) {
		// 구현내용
		System.out.println("빼기 : " + (dx-dy));
	} 	
}