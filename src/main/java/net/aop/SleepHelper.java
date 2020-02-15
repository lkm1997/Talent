package net.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SleepHelper
{

	@Pointcut("execution(public * *.*sleep(..))")
	public void sleepPointcut(){
	}

	@Before("sleepPointcut()")
	public void before(){
		System.out.println("before");
	}

	@AfterReturning("sleepPointcut()")
	public void after(){
		System.out.println("AfterReturning");
	}

	@Around("sleepPointcut()")
	public void around(ProceedingJoinPoint joinPoint) throws Throwable
	{
		System.out.println("beforexxxxx");
		joinPoint.proceed();
		System.out.println("afterxxxxx");
	}





}
