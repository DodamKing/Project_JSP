package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemUpdateOkcommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "";
		String pwd = "";
		String nickName = "";
		String name = "";
		String name_ = "";
		String gender = "";
		String birthday = "";
		String tel = "";
		String tel1 = "";
		String tel2 = "";
		String tel3 = "";
		String address = "";
		String email = "";
		String email1 = "";
		String email2 = "";
		String homePage = "";
		String job = "";
		String[] hobbys;
		String hobby = "";
		String content = "";
		String userInfor = "";
		
		
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid").trim();
		}
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd").trim();
		}
		if (request.getParameter("nickName") != null) {
			nickName = request.getParameter("nickName").trim();
		}
		if (request.getParameter("name") != null) {
			name = request.getParameter("name").trim();
		}
		name_ = name;
		if (request.getParameter("gender") != null) {
			gender = request.getParameter("gender").trim();
		}
		if (request.getParameter("birthday") != null) {
			birthday = request.getParameter("birthday").trim();
		}
		if (request.getParameter("tel1") != null) {
			tel1 = request.getParameter("tel1").trim();
		}
		if (request.getParameter("tel2") != null) {
			tel2 = request.getParameter("tel2").trim();
		}
		if (request.getParameter("tel3") != null) {
			tel3 = request.getParameter("tel3").trim();
		}
		tel = tel1 + "-" + tel2 + "-" + tel3;
		if (request.getParameter("address") != null) {
			address = request.getParameter("address").trim();
		}
		if (request.getParameter("email1") != null) {
			email1 = request.getParameter("email1").trim();
		}
		if (request.getParameter("email2") != null) {
			email2 = request.getParameter("email2").trim();
		}
		email = email1 + "@" + email2;
		if (request.getParameter("homePage") != null) {
			homePage = request.getParameter("homePage").trim();
		}
		if (request.getParameter("job") != null) {
			job = request.getParameter("job").trim();
		}
		if (request.getParameter("userInfor") != null) {
			userInfor = request.getParameter("userInfor");
		}
		hobbys = request.getParameterValues("hobby");
		for (int i=0; i<hobbys.length; i++) {
			hobby += hobbys[i] + "/";
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		if (request.getParameter("content") != null) {
			content = request.getParameter("content").trim();
		}
		
		MemberDAO dao = new MemberDAO();
		pwd = pwd.toUpperCase();
		
		int pwdKey;
		long encPwd;
		long intPwd;
		long pwdValue;
		String strPwd = "";

		for (int i=0; i<pwd.length(); i++) {
			intPwd = (long) pwd.charAt(i);
			strPwd += intPwd;
		}
		
		pwdKey = (int) (Math.random( ) * 20);
		pwdValue = dao.getHashTableSearch(pwdKey);
		
		intPwd = Long.parseLong(strPwd);
		
		encPwd = intPwd ^ pwdValue; //키 값으로 암호화 시키는 중 인코딩
		strPwd = String.valueOf(encPwd);
		
		MemberVo vo = new MemberVo();
		vo.setMid(mid);
		vo.setPwd(strPwd);
		vo.setPwdKey(pwdKey);
		vo.setNickName(nickName);
		vo.setName(name_);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberUpdateOk(vo);
		
		if (res != -1) {
			request.setAttribute("msg", "memUpdateOk");
		}
		else {
			request.setAttribute("msg", "memUpdateNo");
		}
		request.setAttribute("url", request.getContextPath() + "/memMain.mem");
	}

}
