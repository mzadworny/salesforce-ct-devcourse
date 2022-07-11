public class CTPersonController {
    public static String getToken(String mobile) {
        Blob targetBlob = Blob.valueOf(mobile);
        Blob encryptedMobile = Crypto.generateDigest('MD5', targetBlob);

        // get the string value from blob
        return EncodingUtil.base64Encode(encryptedMobile);
    }
}