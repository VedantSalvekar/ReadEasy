package extras;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import com.mysql.cj.xdevapi.JsonParser;

@SuppressWarnings("deprecation")
public class MailChimp {
	public static String postToURL(String url, String message) throws IOException, IllegalStateException, UnsupportedEncodingException, RuntimeException {
	       StringEntity entity = new StringEntity(message,ContentType.APPLICATION_JSON);

	        HttpClient httpClient = HttpClientBuilder.create().build();
	        HttpPost request = new HttpPost(url);
	        request.addHeader("Authorization","nik 69d59f7a30d94704f40567a87aa7d29b-us20");
	        request.addHeader("Content-Type","application/json");
	        request.setEntity(entity);

	        HttpResponse response = httpClient.execute(request);
	        return "Status code : "+response.toString();
	}
}
