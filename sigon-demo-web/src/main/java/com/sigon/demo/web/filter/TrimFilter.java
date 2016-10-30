package com.sigon.demo.web.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: jacky zhung
 * Date: 14-12-26
 * Time: 下午5:48
 */
public class TrimFilter extends OncePerRequestFilter {

	Logger log = LoggerFactory.getLogger(TrimFilter.class);

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ParameterRequestWrapper requestWrapper= new ParameterRequestWrapper(request);
		filterChain.doFilter(requestWrapper, response);
	}

	class ParameterRequestWrapper  extends HttpServletRequestWrapper {
		private Map<String , String[]> params = new HashMap<String, String[]>();
		public ParameterRequestWrapper (HttpServletRequest request) {
			super(request);
			this.params.putAll(request.getParameterMap());
			this.trimWhiteSpace();
		}
		public void trimWhiteSpace(){
			Set<String> set =params.keySet();
			Iterator<String> it=set.iterator();
			while(it.hasNext()){
				String key=  it.next();
				String[] values = params.get(key);
				values[0] = values[0].trim();
				//考虑进行转义，主要处理<>
				values[0] = values[0].replaceAll("<","&lt;");
				values[0] = values[0].replaceAll(">","&gt;");
				values[0] = values[0].replaceAll("\"","&quot;");
				params.put(key, values);
			}
		}
		@Override
		public String getParameter(String name) {
			// 返回值之前 先进行过滤
			String[]values = params.get(name);
			if(values == null || values.length == 0) {
				return null;
			}
			return values[0];
		}

		@Override
		public String[] getParameterValues(String name) {
			return params.get(name);
		}
	}
}
