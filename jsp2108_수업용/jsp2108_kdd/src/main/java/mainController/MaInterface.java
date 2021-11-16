package mainController;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MaInterface {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException;
}
