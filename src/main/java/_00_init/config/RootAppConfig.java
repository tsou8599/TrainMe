package _00_init.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement //加了此註釋，才可使用@Transactional
public class RootAppConfig {
	
	
    @Bean
    public DataSource dataSource() {
        ComboPooledDataSource ds = new ComboPooledDataSource();
        ds.setUser("root");
        ds.setPassword("java123");
        try {
            ds.setDriverClass("com.mysql.cj.jdbc.Driver");
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        ds.setJdbcUrl("jdbc:mysql://localhost:3306/trainme?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Taipei");
        ds.setInitialPoolSize(4);
        ds.setMaxPoolSize(8);
        return ds;
    }
    
  
    @Bean     // 產生session工廠所需要的三種資訊要在這邊定義
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        
        factory.setDataSource(dataSource());         // 連線資訊
        factory.setPackagesToScan(new String[] {     // 映射資訊的來源(套件名稱)
                    "_01_register.model","_03_memberData.model","_04_money.model","_07_memberInfo.model",
                    "_09_trainerCourse.model","_10_studentCourse.model","_11_orderProcess.model",
                    "_12_message.model","_13_addfavorite.model","_14_forum.model"
                });
        factory.setHibernateProperties(additionalProperties());   // 進階資訊
       
        return factory;
    }
    
    
    @Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }    
    
    private Properties additionalProperties() {    // 進階資訊
        Properties properties=new Properties();
        properties.put("hibernate.dialect", org.hibernate.dialect.MySQL57Dialect.class);
        properties.put("hibernate.show_sql", Boolean.TRUE);
        properties.put("hibernate.format_sql", Boolean.TRUE);
        properties.put("default_batch_fetch_size", 10);
        properties.put("hibernate.hbm2ddl.auto", "update");
        return properties;
    }
}
