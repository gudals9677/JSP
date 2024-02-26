package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.UserService;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher= req.getRequestDispatcher("/user/register.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String uid = req.getParameter("uid");
		String pass1 = req.getParameter("pass1");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp = req.getParameter("hp");
		String sms = req.getParameter("sms");
		//유저 ip
		String regip = req.getRemoteAddr();
		
		//
		//HttpSession session = req.getSession();
		//String sms = (String) session.getAttribute("sms");
		
		//UserDTO생성
		UserDTO user = new UserDTO();
		user.setUid(uid);
		user.setPass(pass1);
		user.setName(name);
		user.setNick(nick);
		user.setEmail(email);
		user.setHp(hp);
		user.setRegip(regip);
		user.setSms(sms);
		
		//로그 출력
		logger.debug(user.toString());
		
		//데이터 insert
		service.insertUser(user);
		
		//리다이렉트
		resp.sendRedirect("/jboard2/user/login.do");
	}
	
}
