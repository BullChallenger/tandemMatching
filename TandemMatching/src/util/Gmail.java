package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication
				("2GatherTandem@gmail.com", "tandemmatching2022!@#"); // 관리자 계정의 메일 입력
	}
}
