package cargo.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		MemberDAO mdao = new MemberDAO();
		int state = mdao.LogingetMember(email, pwd);

		ActionForward forward = new ActionForward();

		response.setContentType("text/html; charset=utf-8");

		// 0: 이메일 없음, -1: 비밀번호 틀림, 1: 성공
		if (state == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('등록된 이메일이 없습니다. \\n확인 후 다시 로그인 해 주세요.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("로그인 오류 ");
			out.close();

			return null;
		} else if (state == -1) {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. \\n확인 후 다시 로그인 해 주세요.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("로그인 오류 ");
			out.close();

			return null;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("email", email);

			String path = request.getContextPath();
			forward.setRedirect(true);
			forward.setPath(path + "/index.jsp");
		}
		return forward;
	}
}
