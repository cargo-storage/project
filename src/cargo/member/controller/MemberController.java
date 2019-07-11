package cargo.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.action.EmailAuthAction;
import cargo.member.action.JoinAction;
import cargo.member.action.LoginAction;
import cargo.member.action.LogoutAction;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		//가상요청 주소 가져오기
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		String contextPath=request.getContextPath();
		System.out.println(contextPath.length());
		System.out.println(RequestURI.lastIndexOf("/"));
		
//		System.out.println("??: "+request.getPathInfo()); xml로 했을땐 안되는듯?!
		
//		String command=RequestURI.substring(contextPath.length()); //이건 선생님이 한것
		
		//이부분은 xml필터링을 *.me로 하지 않고 /폴더/*로 하였기 때문에 제가 바꾼것입니다.
		//그런데 /폴더/*로 하는게 관리하기 더 편하지 않나요? 겹치지도 않고 contextPath.length도 쓰지 않음
		String command=RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println(command);
		
		ActionForward forward = null;
		Action action= null;
		
		try {
			if(command.equals("/join.me")){ //회원 가입
				action=new JoinAction();
				forward = action.execute(request, response);
			}else if(command.equals("/login.me")){ //로그인
				action = new LoginAction();
				forward = action.execute(request, response);
			}else if(command.equals("/logout.me")) { //로그아웃
				action = new LogoutAction();
				forward = action.execute(request, response);
			}else if(command.equals("/emailAuth.me")) { //이메일 인증
				action = new EmailAuthAction();
				forward = action.execute(request, response);
			}
			
			//모든 과정 후 페이지 이동부분
			if(forward !=null){
				if(forward.isAjax()){
					//Ajax방식이였으면 이동시키지 말아야합니다.
				}else if(forward.isRedirect()){
					//sendRedirect 방식으로 보내는 경우
					response.sendRedirect(forward.getPath());
				}else{
					//Dispatcher방식으로 보낼 때 forwarding 해준다
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
