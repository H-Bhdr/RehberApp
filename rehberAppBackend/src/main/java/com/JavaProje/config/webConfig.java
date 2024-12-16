package com.JavaProje.config;   
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class webConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")  
        		.allowedOrigins("http://127.0.0.1", "http://localhost", "http://10.3.8.114", "http://localhost:8000","http://localhost:50994", "http://10.0.2.2") // Gerekirse tarayıcıda ve emülatörde farklı adresler kullanabilirsiniz
        		.allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*")
                .allowCredentials(true);  
    }
}
