package cargo.market.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.action.AddCommentAction;
import cargo.market.action.MarketMainAction;
import cargo.market.action.PostItemAction;
import cargo.market.action.ShowContentAction;

public class MarketController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String RequestURI = request.getRequestURI();
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		ActionForward forward = null;
		Action action= null;
		
		System.out.println(command);
		
		try {
			
			if(command.equals("/market.do")){	// 메인페이지로 이동 - DB작업수정해야함
				action = new MarketMainAction();
				forward = action.execute(request, response);
			}else if(command.equals("/uploaditem.do")){	// 글쓰기 페이지로 이동
				forward = new ActionForward();
				forward.setPath("../market/market_post.jsp");
			}else if(command.equals("/cart.do")){	// 장바구니 페이지로 이동
				forward = new ActionForward();
				forward.setPath("../market/market_cart.jsp");
			}else if(command.equals("/showcontent.do")){	// 상세글보기 페이지로 이동 - DB작업해서 뿌리는걸로 수정, 글번호 넘겨야함
				action = new ShowContentAction();
				forward = action.execute(request, response);
			}else if(command.equals("/postItem.do")){ // ${contextPath }/mk/postItem.do 글쓰기 + 파일업로드 액션
				action = new PostItemAction();
				forward = action.execute(request, response);
			}else if(command.equals("/modifyItem.do")){ // 글 수정 액션
				
			}else if(command.equals("/deleteItem.do")){ // 글 삭제 액션
				
			}else if(command.equals("/addComment.do")){ // 댓글 등록 액션
	            action = new AddCommentAction();
	            forward=action.execute(request, response);
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
			System.out.println("MarketController 에러" + e);
			e.printStackTrace();
			
		}
	}

}