package kr.or.test;
/**
 * 클래스자료형 사용
 * @author 이시은
 *
 */
class MemberVO {
	//멤버변수 만들기
	private String name;
	private int age;
	private String phoneNum;
	
	//멤버변수는 보안때문에 private로 생성 
	//get, set 메소드는 입/출력을 위해 public으로 생성
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}
	
}
public class Step2 {

	public static void main(String[] args) {
		// 실행 메소드
		// 멤버변수 name이 public String name; 으로 선언되었다면
		// memberVO.name="ooo"; 으로 바로 접근 가능
		MemberVO memberVO = new MemberVO();
		memberVO.setName("홍길동");
		memberVO.setAge(45);
		memberVO.setPhoneNum("010-0000-0000");
		
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		
		// 위 각각  3개의 레코드를 1군데 담을 배열 클래스 오브젝트를 하나 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;
	}

}
