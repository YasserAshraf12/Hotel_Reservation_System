package Util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;


public class HibernateUtil {

    
    private static Configuration configuration;
    private static SessionFactory sessionFactory;
    
    static {
        try {
           configuration = new Configuration().configure("hibernate.cfg.xml");
          sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }
     
    public static Session getSession() {
         Session session = null;
          if (sessionFactory != null) {
            session = sessionFactory.openSession();
          }
         return session;
    }
    
    public static void closeSession(){
        sessionFactory.close();
    }

}

