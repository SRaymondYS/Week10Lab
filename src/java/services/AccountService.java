package services;

import dataaccess.UserDB;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;

/**
 *
 * @author awarsyle
 */
public class AccountService 
{
    public User login(String email, String password, String path) throws Exception 
    {
        UserDB userDB = new UserDB();
        User user = userDB.getUser(email);
        
        if (user == null) 
        {
            return null;
        }
        
        if (!user.getPassword().equals(password)) 
        {
            return null;
        }
        
        /*
        Logger.getLogger(AccountService.class.getName())
                .log(Level.INFO, "User logged in: {0}", email);
        
        //GmailService.sendMail(user.getEmail(), "Logged In",
        //        "You have successfully logged into The Home Inventory Application.", false);
        
        String to = "RSWebCPRG352+TEST@gmail.com";//user.getEmail();
        String subject = "Home Inventory - login";
        String template = path + "/emailtemplates/login.html";
        HashMap<String, String> tags = new HashMap<>();
        tags.put("firstname", user.getFname());
        tags.put("date", ((new Date()).toString()));
        
        //GmailService.sendMail(to, subject, template, tags);
        */
        return user;
    }
    
    public void resetPassword(String email, String path, String url) throws Exception
    {
        UserDB udb = new UserDB();
        
        User u = udb.getUser(email);
        
        if(u == null)
        {
            return;
        }
        
        String uuid = UUID.randomUUID().toString();
        u.setResetPasswordUUID(uuid);
        
        udb.update(u);
        
        String subject = "Home Inventory - Reset Password";
        String template = path + "/emailtemplates/resetpassword.html";
        String link = url + "?uuid=" + uuid;
        
        HashMap<String, String> tags = new HashMap<>();
        tags.put("firstname", u.getFname());
        tags.put("lastname", u.getLname());
        tags.put("link", link);
        
        GmailService.sendMail(email, subject, template, tags);
    }
    
    public boolean changePassword(String uuid, String password)
    {
        UserService us = new UserService();
        try 
        {
            User user = us.getByUUID(uuid);
            user.setPassword(password);
            user.setResetPasswordUUID(null);
            
            UserDB udb = new UserDB ();
            udb.update(user);
            return true;
        } 
        catch (Exception ex) 
        {
            return false;
        }
    }
}
