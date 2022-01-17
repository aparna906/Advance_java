package service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.ResourceBundle;

public class EmailDao {
    public static void main(String[] args) throws MessagingException {
        String message = "Hello,Only for testing" ;
        String subject = "Tesing" ;
        String to = "en19ca502004@medicaps.ac.in" ;
        String from = "aparna.misar@hotwaxsystems.com" ;

        sendEmail(message, subject, to, from);
    }

    private static void sendEmail(String message, String subject, String to, String from) throws MessagingException {
        //variable for gmail host
        String host = "smtp.gmail.com" ;
        //Fetch properties
        Properties properties = System.getProperties();

        //setting information
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", 465); //smtp port 465
        properties.put("mail.smtp.ssl.enable", true); //Secure Sockets Layer
        properties.put("mail.smtp.auth", true); //Secure Sockets Layer

        //Get session object
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                ResourceBundle resourceBundle = ResourceBundle.getBundle("email");
                String userName = resourceBundle.getString("userName");
                String password= resourceBundle.getString("password");
                return new PasswordAuthentication(userName,password);

            }
        });

        session.setDebug(true);
        //compose message[text/media]
        MimeMessage mimeMessage = new MimeMessage(session);

        //set from email
        try {
            mimeMessage.setFrom(from);
            //adding recipient to message
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //send msg using Transport class
        Transport.send(mimeMessage);
        System.out.println("Successfully send Mail");
    }
}

