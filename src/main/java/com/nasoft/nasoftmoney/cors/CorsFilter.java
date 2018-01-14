package com.nasoft.nasoftmoney.cors;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.nasoft.nasoftmoney.config.property.NasoftmoneyApiProperty;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CorsFilter implements Filter {

    @Autowired
    private NasoftmoneyApiProperty nasoftmoneyApiProperty;
    
	@Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        
		System.out.println("Filtro cors");
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        
        response.setHeader("Access-Control-Allow-Origin", nasoftmoneyApiProperty.getOriginPermitida());        
        response.setHeader("Access-Control-Allow-Credentials", "true");
        
        /*System.out.println("nasoftmoneyApiProperty.getOriginPermitida():"+nasoftmoneyApiProperty.getOriginPermitida());
        System.out.println("request.getMethod():"+request.getMethod());
        System.out.println("request.getHeader('Origin'):"+request.getHeader("Origin"));*/
        
        if ("OPTIONS".equals(request.getMethod()) && nasoftmoneyApiProperty.getOriginPermitida().equals(request.getHeader("Origin"))) {
            response.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT, OPTIONS");
            response.setHeader("Access-Control-Allow-Headers", "Authorization, Content-Type, Accept");                                                                
            response.setHeader("Access-Control-Max-Age", "3600");
            //System.out.println("atualizou cors na requisicao options");
            
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            chain.doFilter(req, resp);
        }
        
    }
	
	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
