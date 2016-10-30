package com.sigon.demo.web.interceptor;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: sigon
 * Date: 14-12-12
 * Time: 下午5:45
 * 防止xss攻击
 */
public class ValidateInterceptor implements HandlerInterceptor {

    private Set<String> exclude;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        Map<String,String[]> params = request.getParameterMap();
        //安全验证，如果参数为字符串，且参数值含有<script>，则返回错误页
        for(String key :params.keySet()) {
            if(CollectionUtils.isNotEmpty(exclude) && exclude.contains(key)){
                continue;
            }
            if(params.get(key) instanceof String[]) {
                String[] values = (String[])params.get(key);
                if(values!=null && values.length>0) {
                    for (String value : values) {
                        if(value.toLowerCase().contains("script") || value.toLowerCase().contains("<style>") || value.contains("<")|| value.contains(":@")) {
                                return false;
                        }
                    }
                }
            }
        }
        return true;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public Set<String> getExclude() {
        return exclude;
    }

    public void setExclude(Set<String> exclude) {
        this.exclude = exclude;
    }
}
