package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public interface SongInterface {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
