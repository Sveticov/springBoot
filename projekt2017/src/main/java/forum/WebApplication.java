package forum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class WebApplication extends SpringBootServletInitializer {

   protected SpringApplicationBuilder context(SpringApplicationBuilder builder){
       return builder.sources(WebApplication.class);
   }


    public static void main(String[] args) throws Exception{
        SpringApplication.run(WebApplication.class,args);
    }
}
