import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ChatbotServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userMessage = request.getParameter("message");
        String botResponse = generateBotResponse(userMessage);
        
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.write(botResponse);
        out.flush();
    }

    private String generateBotResponse(String userMessage) {
        // Simple bot responses (you can expand this logic)
        if (userMessage.toLowerCase().contains("hello")) {
            return "Hello! How can I assist you today?";
        } else if (userMessage.toLowerCase().contains("blockchain")) {
            return "Blockchain is a decentralized, distributed ledger technology.";
        } else if (userMessage.toLowerCase().contains("crypto")) {
            return "Cryptocurrency is a type of digital asset designed to work as a medium of exchange.";
        } else {
            return "I'm sorry, I didn't understand that. Can you rephrase?";
        }
    }
}
