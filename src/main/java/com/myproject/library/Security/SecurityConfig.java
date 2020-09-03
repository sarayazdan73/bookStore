package com.myproject.library.Security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.data.repository.query.SecurityEvaluationContextExtension;

import javax.sql.DataSource;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter  {


    @Autowired
    DataSource dataSource;

    @Override

    public void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery(
                        "select user_name as username,password, 1 from myusers where user_name=?")
                .authoritiesByUsernameQuery(
                        "SELECT myusers.user_name as username ,role.name as role from myusers  inner join role on role.id=myusers.role_id where myusers.user_name =?");
    }


    @Override

    protected void configure(HttpSecurity http) throws Exception {

        http
                .authorizeRequests()
               .antMatchers(HttpMethod.GET, "/home").permitAll()
//                        .antMatchers(HttpMethod.GET, "/data/**").hasRole("USER")
//                        .antMatchers(HttpMethod.GET, "/rest/**").hasRole("ADMIN")
                .anyRequest().permitAll().and()
                .csrf().disable()
                .formLogin().loginPage("/login").defaultSuccessUrl("/home",true)
                .permitAll()
                .and()
                .logout().permitAll().and()
                .exceptionHandling()
                .accessDeniedPage("/AccessDenied").and()
                .httpBasic();

    }

    @Bean
    public SecurityEvaluationContextExtension securityEvaluationContextExtension() {
        return new SecurityEvaluationContextExtension();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}

