package song;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.so")
public class SongController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SongInterface command;
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String view = "/WEB-INF/view/song";
		
		if (com.equals("/sotrack")) {
			command = new GetSongInforCommand();
			command.execute(request, response);
			view += "/songInfor.jsp";
		}

		else if (com.equals("/solyrics")) {
			command = new GetLyricsCommand();
			command.execute(request, response);
			return;
		}

		else if (com.equals("/solike")) {
			command = new SetsoLikeCommand();
			command.execute(request, response);
			return;
		}

		else if (com.equals("/sounlike")) {
			command = new SetsounLikeCommand();
			command.execute(request, response);
			return;
		}

		else if (com.equals("/soLikebtn")) {
			command = new SoLikebtnCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
