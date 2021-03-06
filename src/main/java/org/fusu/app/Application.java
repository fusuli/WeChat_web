package org.fusu.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//Spring Boot 应用的标识
/**
 * 
 * springboot程序的启动入口
 * 
 * @project: wechat_web
 * @ClassName: Application
 * @Description:
 * @author fusu
 * 
 */
@SpringBootApplication
// mapper 接口类扫描包配置
@MapperScan("org.fusu.dao")
public class Application {

	public static void main(String[] args) {
		// 程序启动入口
		// 启动嵌入式的 Tomcat 并初始化 Spring 环境及其各 Spring 组件
		SpringApplication.run(Application.class, args);
	}
}
