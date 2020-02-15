package net.aop;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
public class AopUser
{
	public void sleep() {
		System.out.println("开始睡觉");
	}
}
