package com.marjanepromotion.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import io.github.cdimascio.dotenv.Dotenv;

public class MailSender {

    public static void sendMail(String userEmail, String msg) {

        Dotenv dotEnv = Dotenv
                .configure()
                .directory("C:\\Users\\Youcode\\IdeaProjects\\MarjanePromotion")
                .filename(".env")
                .load();

        // Sender's email ID needs to be mentioned
        String email = dotEnv.get("EMAIL_ADDRESS");
        String password = dotEnv.get("EMAIL_PASSWORD");

        // Assuming you are sending email from through gmail's smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(email, password);

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            assert email != null;
            message.setFrom(new InternetAddress(email));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

            // Set Subject: header field
            message.setSubject("Marjane Promotions Department: Account information");

            // Now set the actual message
            message.setText(msg);

            // Send message
            Transport.send(message);

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

}