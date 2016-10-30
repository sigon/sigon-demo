package com.sigon.demo.web.interceptor;


import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: 光
 * Date: 15-9-23
 * Time: 下午4:07
 * To change this template use File | Settings | File Templates.
 */
public class ProfilerInterceptor implements MethodInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(ProfilerInterceptor.class);

    private volatile int threshold = 100;  //方法执行时间在100ms以下不打印日志
    private boolean switchOn = true;

    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        if(switchOn){
            Date start = new Date();
            Object result = methodInvocation.proceed();
            Date end = new Date();
            long diff = end.getTime()-start.getTime();
            if(diff>threshold){
                logger.error("method " + methodInvocation.getMethod().getDeclaringClass()+ "." + methodInvocation.getMethod().getName() + " execute " + diff + "ms");
            }
            return result;
        }else{
            return methodInvocation.proceed();
        }
    }

    public static Logger getLogger() {
        return logger;
    }

    public int getThreshold() {
        return threshold;
    }

    public void setThreshold(int threshold) {
        this.threshold = threshold;
    }

    public boolean isSwitchOn() {
        return switchOn;
    }

    public void setSwitchOn(boolean switchOn) {
        this.switchOn = switchOn;
    }
}
