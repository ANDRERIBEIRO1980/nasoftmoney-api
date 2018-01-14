package com.nasoft.nasoftmoney.token;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import com.nasoft.nasoftmoney.config.property.NasoftmoneyApiProperty;

//atualiza responsebody da classe OAuth2AccessToken para retirar o refreshtoken do json de resposta
@ControllerAdvice
public class RefreshTokenPostProcessor implements ResponseBodyAdvice<OAuth2AccessToken> {


    @Autowired
    private NasoftmoneyApiProperty nasoftmoneyApiProperty;
    
	@Override
	public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {

		//só executa quando o método de chamada for igual a postAccessToken que esta
		//para descobrir coloque um syso de returnType.getMethod().getName()
		return returnType.getMethod().getName().equals("postAccessToken");
	}

	@Override
	public OAuth2AccessToken beforeBodyWrite(OAuth2AccessToken body, MethodParameter returnType,
			MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType,
			ServerHttpRequest request, ServerHttpResponse response) {
		
		HttpServletRequest req = ((ServletServerHttpRequest) request).getServletRequest();
		HttpServletResponse resp = ((ServletServerHttpResponse) response).getServletResponse();
		
		DefaultOAuth2AccessToken token = (DefaultOAuth2AccessToken) body;
		
		String refreshToken = body.getRefreshToken().getValue();
		adicionarRefreshTokenNoCookie(refreshToken, req, resp);
		removerRefreshTokenDoBody(token);
		
		return body;
	}

	private void removerRefreshTokenDoBody(DefaultOAuth2AccessToken token) {
		token.setRefreshToken(null);
	}


	private void adicionarRefreshTokenNoCookie(String refreshToken, HttpServletRequest req, HttpServletResponse resp) {
		
		Cookie refreshTokenCookie = new Cookie("refreshToken", refreshToken);
	    //refreshTokenCookie.setHttpOnly(true);
		
		System.out.println(nasoftmoneyApiProperty.getSeguranca().isEnableHttps());
		System.out.println(req.getContextPath() + "/oauth/token");
		System.out.println(nasoftmoneyApiProperty.getOriginPermitida() + "/oauth/token");
		
		refreshTokenCookie.setSecure(nasoftmoneyApiProperty.getSeguranca().isEnableHttps());		
		//refreshTokenCookie.setPath(nasoftmoneyApiProperty.getOriginPermitida() + "/oauth/token");
		refreshTokenCookie.setMaxAge(2592000);
		
		resp.addCookie(refreshTokenCookie);
	}

}
