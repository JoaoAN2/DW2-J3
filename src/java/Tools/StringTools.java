package Tools;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author JoaoAN
 */
public class StringTools {

    public String capitalize(String x) {
        String res = "";
        for (int i = 0; i < x.length(); i++) {
            if (i == 0) {
                res = res + x.toUpperCase().charAt(i);
            } else{
                res = res + x.toLowerCase().charAt(i);
            }
        }
        return res;
    }
    
    public String firstLetterToLowerCase(String x) {
        String res = "";
        for (int i = 0; i < x.length(); i++) {
            if (i == 0) {
                res = res + x.toLowerCase().charAt(i);
            } else{
                res = res + x.charAt(i);
            }
        }
        return res;
    }
    
    public String firstLetterToUpperCase(String x) {
        String res = "";
        for (int i = 0; i < x.length(); i++) {
            if (i == 0) {
                res = res + x.toUpperCase().charAt(i);
            } else{
                res = res + x.charAt(i);
            }
        }
        return res;
    }
    
    public String bdToString(String x) {
        return x;
    }
    
    public String inputStreamToString(InputStream stream) throws IOException {
        int bufferSize = 1024;
        char[] buffer = new char[bufferSize];
        StringBuilder out = new StringBuilder();
        Reader in = new InputStreamReader(stream, StandardCharsets.UTF_8);
        for (int numRead; (numRead = in.read(buffer, 0, buffer.length)) > 0;) {
            out.append(buffer, 0, numRead);
        }
        return out.toString();
    }
}
