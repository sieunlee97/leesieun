package kr.or.member;

public class MemberVO {
	// 멤버변수 만들기
	private String name;
	private int age;
	private String phoneNum;

	// 멤버변수는 보안때문에 private로 생성
	// get, set 메소드는 입/출력을 위해 public으로 생성
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
		return "디버그용 MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}
}
