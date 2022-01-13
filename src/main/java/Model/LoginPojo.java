package Model;

public class LoginPojo {
    String userId;
    String password;
    int partyId;

    public LoginPojo() {
    }

    public LoginPojo(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }

    public String getUserId() {

        return userId;
    }

    public void setUserId(String userId) {

        this.userId = userId;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public int getPartyId() {

        return partyId;
    }

    public void setPartyId(int partyId) {

        this.partyId = partyId;
    }

    @Override
    public String toString() {
        return "LoginPojo{" +
                "userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", partyId=" + partyId +
                '}';
    }
}
