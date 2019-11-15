package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.AccountService;

/**
 *
 * @author 794471
 */
public class ResetPasswordServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String uuid = request.getParameter("uuid");
        
        if(uuid == null)
        {
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("resetUUID", uuid);
            getServletContext().getRequestDispatcher("/WEB-INF/resetNewPassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        AccountService as = new AccountService();
        String uuid = request.getParameter("resetUUID");
        
        if(uuid == null)
        {
            String email = request.getParameter("resetEmail");

            String path = getServletContext().getRealPath("/WEB-INF");
            String url = request.getRequestURL().toString();

            try
            {
                as.resetPassword(email, path, url);
            }
            catch(Exception e)
            {

            }   
            request.setAttribute("message", "A link will be sent if the email is registered.");
     
            getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
        }
        else
        {
            String password = request.getParameter("resetPassword");
            
            try
            {
                as.changePassword(uuid, password);
            }
            catch(Exception e)
            {

            }  
            request.setAttribute("message", "Password changed successfully.");
        
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response); 
        }        
       
    }

    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }
}
