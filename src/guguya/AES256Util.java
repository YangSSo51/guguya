package guguya;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
 
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
 
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
 
public class AES256Util {
    
    public static void main(String[] args) throws UnsupportedEncodingException, GeneralSecurityException, DecoderException {        
        String ciphertext = "U2FsdGVkX18MF2JZTziUZiqftAX51UVTamAeJTpqLnDMRjynAMd/rJEenzB1JnMH";
        String password = "1234";
        System.out.println ("복호화"+decrypt(ciphertext, password) );
       }
    
    public static String decrypt(String ciphertext, String passphrase) {
        try {
            final int keySize = 256;
            final int ivSize = 128;
 
            // 텍스트를 BASE64 형식으로 디코드 한다.
            byte[] ctBytes = Base64.decodeBase64(ciphertext.getBytes("UTF-8"));
 
            // 솔트를 구한다. (생략된 8비트는 Salted__ 시작되는 문자열이다.) 
            byte[] saltBytes = Arrays.copyOfRange(ctBytes, 8, 16);
            //System.out.println( Hex.encodeHexString(saltBytes) );
            
            // 암호화된 테스트를 구한다.( 솔트값 이후가 암호화된 텍스트 값이다.)
            byte[] ciphertextBytes = Arrays.copyOfRange(ctBytes, 16, ctBytes.length);
                       
            // 비밀번호와 솔트에서 키와 IV값을 가져온다.
            byte[] key = new byte[keySize / 8];
            byte[] iv = new byte[ivSize / 8];
            EvpKDF(passphrase.getBytes("UTF-8"), keySize, ivSize, saltBytes, key, iv);
            
            // 복호화 
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
            byte[] recoveredPlaintextBytes = cipher.doFinal(ciphertextBytes);
            System.out.println(recoveredPlaintextBytes);
            //String c=new String(recoveredPlaintextBytes);
            String c=recoveredPlaintextBytes.toString();

            System.out.println("암호문"+ciphertext+"\n"+passphrase);
            System.out.println("복호화 내에서"+c);
            return new String(recoveredPlaintextBytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("실패");
        return null;
    }
    
    private static byte[] EvpKDF(byte[] password, int keySize, int ivSize, byte[] salt, byte[] resultKey, byte[] resultIv) throws NoSuchAlgorithmException {
        return EvpKDF(password, keySize, ivSize, salt, 1, "MD5", resultKey, resultIv);
    }
 
    private static byte[] EvpKDF(byte[] password, int keySize, int ivSize, byte[] salt, int iterations, String hashAlgorithm, byte[] resultKey, byte[] resultIv) throws NoSuchAlgorithmException {
        keySize = keySize / 32;
        ivSize = ivSize / 32;
        int targetKeySize = keySize + ivSize;
        byte[] derivedBytes = new byte[targetKeySize * 4];
        int numberOfDerivedWords = 0;
        byte[] block = null;
        MessageDigest hasher = MessageDigest.getInstance(hashAlgorithm);
        while (numberOfDerivedWords < targetKeySize) {
            if (block != null) {
                hasher.update(block);
            }
            hasher.update(password);            
            // Salting 
            block = hasher.digest(salt);
            hasher.reset();
            // Iterations : 키 스트레칭(key stretching)  
            for (int i = 1; i < iterations; i++) {
                block = hasher.digest(block);
                hasher.reset();
            }
            System.arraycopy(block, 0, derivedBytes, numberOfDerivedWords * 4, Math.min(block.length, (targetKeySize - numberOfDerivedWords) * 4));
            numberOfDerivedWords += block.length / 4;
        }
        System.arraycopy(derivedBytes, 0, resultKey, 0, keySize * 4);
        System.arraycopy(derivedBytes, keySize * 4, resultIv, 0, ivSize * 4);
        return derivedBytes; // key + iv
    }    
}
