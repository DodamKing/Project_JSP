package getTest;

public class PasswordTest {
	public static void main(String[] args) {
		String pwd = "qwe123";
		pwd = pwd.toUpperCase();
		int pwdKeyNo = (int) (Math.random() * 20);
		long pwdKey = 34343434;
//		long pwdKey_ = Long.parseLong(pwdKey);
		long intPwd;
		String strPwd = "";
		
		
		for (int i=0; i<pwd.length(); i++) {
			intPwd = pwd.charAt(i);
			strPwd += intPwd;
		}
		intPwd = Long.parseLong(strPwd);
		
		long encPwd = intPwd ^ pwdKey;
		pwd = String.valueOf(encPwd);
		
		System.out.println(pwd);
	}
}
