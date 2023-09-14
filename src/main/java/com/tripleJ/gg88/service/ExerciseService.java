package com.tripleJ.gg88.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.domain.Exercise.Thumbnail;

@Service
public class ExerciseService {
	public Exercise search(String search) throws Exception {
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyD1oh2pUIox-pNVm652OsV4Q-cImdiVpQg";
		apiurl += "&part=snippet&type=video&maxResults=10&videoEmbeddable=true";
		apiurl += "&q="+URLEncoder.encode(search,"UTF-8");
		
		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		
		return jsonParse(response.toString());
	}
	
	public Exercise jsonParse(String response) throws Exception {
		JSONObject jObject = new JSONObject(response);
		JSONArray jArray = (JSONArray) jObject.getJSONArray("items");
		
		JSONObject object = jArray.getJSONObject(0);
		JSONObject sinppet = object.getJSONObject("snippet");
		JSONObject id = object.getJSONObject("id");
		
		JSONObject thumbnails = sinppet.getJSONObject("thumbnails");
		JSONObject basic = thumbnails.getJSONObject("default");
		
		Thumbnail thumbnail = new Thumbnail();
		thumbnail.setHeigth(basic.getInt("height"));
		thumbnail.setWidth(basic.getInt("width"));
		thumbnail.setUrl(basic.getString("url"));
		
		String time = sinppet.getString("publishTime");
		String uploadDate = time.substring(0, 10);
		
		Exercise exercise = new Exercise();
		exercise.setUploadDate(uploadDate);
		exercise.setTitle(sinppet.getString("title"));
		exercise.setDescription(sinppet.getString("description"));
		exercise.setThumbnail(thumbnail);
		exercise.setVideoId(id.getString("videoId"));
		
		return exercise;
	}
	

}
