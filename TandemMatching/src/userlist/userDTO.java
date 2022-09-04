package userlist;

public class userDTO {
	
	private String userId; 
	private String userPW;
	private String userEmail;
	private String userEmailHash; // email 체크를 위한 hash 값
	private Boolean userEmailChecked;
	private String userName;
	private String userNationality; // 국적 확인
	private String userPhoneNum;
	private String userInstaAccount; // sns 계정 
	private String userFbAccount; // sns 계정 
	private String userLanguage; // 사용 언어
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public Boolean getUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(Boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNationality() {
		return userNationality;
	}
	public void setUserNationality(String userNationality) {
		this.userNationality = userNationality;
	}
	public String getUserPhoneNum() {
		return userPhoneNum;
	}
	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}
	
	public String getUserInstaAccount() {
		return userInstaAccount;
	}
	public void setUserInstaAccount(String userInstaAccount) {
		this.userInstaAccount = userInstaAccount;
	}
	public String getUserFbAccount() {
		return userFbAccount;
	}
	public void setUserFbAccount(String userFbAccount) {
		this.userFbAccount = userFbAccount;
	}
	public String getUserLanguage() {
		return userLanguage;
	}
	public void setUserLanguage(String userLanguage) {
		this.userLanguage = userLanguage;
	}
	
	public userDTO() {
	}
	
	public userDTO(String userId, String userPW, String userEmail, String userEmailHash, Boolean userEmailChecked,
			String userNationality, String userInstaAccount, String userFbAccount, String userName, String userPhoneNum,
			String userLanguage) {
		super();
		this.userId = userId;
		this.userPW = userPW;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
		this.userNationality = userNationality;
		this.userInstaAccount = userInstaAccount;
		this.userFbAccount = userFbAccount;
		this.userName = userName;
		this.userPhoneNum = userPhoneNum;
		this.userLanguage = userLanguage;
	}
	
}
