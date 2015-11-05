package com.liveman.shop.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class SessionAspect {

	@Around(value = "execution(* *..addProduct(..))")
	public Object checkSession(JoinPoint joinPoint) {
		System.out.println("---------------");
		try {
			Object[] objs = joinPoint.getArgs();

			if (objs[0] instanceof HttpSession && ((HttpSession) objs[0]).getAttribute("user") != null) {
				System.out.println("---------------");
				Object obj =  ((ProceedingJoinPoint) joinPoint).proceed();
				System.out.println(obj);
				return obj;
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
