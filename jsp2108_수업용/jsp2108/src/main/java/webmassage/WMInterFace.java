package webmassage;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WMInterFace {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
