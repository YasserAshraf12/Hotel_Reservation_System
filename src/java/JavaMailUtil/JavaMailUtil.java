package JavaMailUtil;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {
    public void sendMail(String sender, String senderPassword,String msg){
        
        String host = "smtp.gmail.com";

        String username = sender.trim();
        String password = senderPassword.trim();
        
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        String receiver = "yasserashraf1812@gmail.com";
            
        String subject = "Ask Question";
        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
        });
        

        Message message =  prepareMessage(session, sender.trim(), receiver.trim(), subject, msg);

        try {
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
    private Message prepareMessage(Session session, String sender, String receiver, String subject ,String msg){
        Message message = new MimeMessage(session);
        
        try {
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver)); 
            message.setSubject(subject);
            message.setContent(msg, "text/html");
            return message;
        } catch (AddressException ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
