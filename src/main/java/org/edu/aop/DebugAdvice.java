package org.edu.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * DebugAdvice 클래스로서 디버그를 Advice라는  AOP기능을 사용해서 디버그를 실행하게 된다.
 * @author 이시은
 *
 */
@Component // 스프링 빈으로 사용하겠다고 명시
@Aspect // AOP기능을 사용하겠다고 명시
public class DebugAdvice {
	private static final Logger logger = LoggerFactory.getLogger(DebugAdvice.class);
	/**
	 * @throws Throwable 
	 * @Around 어노테이션클래스는 메소드 실행에 직접 관여함.
	 * Around클래스타입의 파라미터(매개변수)로 ProceedingJoinPoint타입의 클래스 사용
	 * ProceedingJoinPoint클래스는 JoinPoint(실행지점)의 모든 메소드를 가지면서,
	 * 직접 타겟클래스의 메소드를 살행할 수 있는 기능이 있음.
	 * ProceedingJoinPoint.proceed()메소드는 특이하게도 Exception클래스보다 상위에 위치하고 Throwable 예외를 전달한다.
	 * 즉, 일반 내부 Exception 예외처리보다 외부에서 ProceedingJointPoint.proceed()메소드로 먼저 처리한다.
	 * proceed()메소드 생성에 Throwable을 사용하고, 시간을 체크하는 기능을 작성할 수 있다.
	 * 위 시간 체크하는 기능이 필요한 이유는? 개발자가 만든 다양한 메소드의 시작과 끝시간을 체크하는 것이 가능하다.
	 * ex) 개발자가 만든 클래스를 실행시켰을 때, 5-10분 이상 느리게 진행되는 현상이 생긴다.
	 * 어느 메소드에서 시간이 얼만큼 소요되는지 확인해야만, 트러블 슈팅이 가능하다.-
	 */
	
	//@Around() 어노테이션 클래스의 ()는 디버그할 영역 지정 
	@Around("execution(* org.edu.controller.AdminController.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.info("========================AOP 디버그 시작============================="); //콘솔에 나올 때 확인하는 용도
		long startTime = System.currentTimeMillis(); // 현재 컴퓨터 시간을 startTime변수에 저장
		
		logger.info(Arrays.toString(pjp.getArgs())); //pjp클래스 매개변수 값을 GET으로 가져와서 toString형변환
		// 현재 시간을 체크하는 메소드가 어떤 메소드인지 눈으로 확인하려고 logger.debug로 출력(위)
		Object result = pjp.proceed(); //AdminController에 있는 메소드가 실행된다.(시간이 소요된다)
		
		long endTime = System.currentTimeMillis(); // 현재 컴퓨터 시간을 endTime변수에 저장
		logger.info(pjp.getSignature().getName() + " 메소드의 실행 시간 : " + (endTime-startTime));
		logger.info("========================AOP 디버그 끝==============================");
		return result;
	}
}
