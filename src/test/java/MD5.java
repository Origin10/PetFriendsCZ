import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class MD5 {

	public static void main(String[] args) throws NoSuchAlgorithmException{
		
		SecureRandom random2=SecureRandom.getInstance("SHA1PRNG");
		
        System.out.println(random2.nextInt());
        
        System.out.println(SecureRandom.getInstanceStrong());
        
		String msg = "這是一個標題檔案"+random2.nextInt();
        MessageDigest md = MessageDigest.getInstance("MD5");
        
        byte[] messageDigest = md.digest(msg.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String hashtext = number.toString(16);
        System.out.println(hashtext);
        
        
        
        
    }

}
