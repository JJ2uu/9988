package com.tripleJ.gg88.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.repository.ExerciseRepository;

@Service
public class ExerciseService {

	public List<Exercise> search(String search) throws Exception {
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyD1oh2pUIox-pNVm652OsV4Q-cImdiVpQg";
		apiurl += "&part=snippet&type=video&maxResults=21&videoEmbeddable=true";
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
		return getList(response.toString(), search);
	}
	
	public List<Exercise> getList(String response, String search) throws Exception {
		JSONObject jObject = new JSONObject(response);
		JSONArray jArray = (JSONArray) jObject.getJSONArray("items");
		
		List<Exercise> exerciseList = new ArrayList<Exercise>();
		
		for (int i = 0; i < jArray.length(); i++) {
			JSONObject object = jArray.getJSONObject(i);
			JSONObject sinppet = object.getJSONObject("snippet");
			JSONObject id = object.getJSONObject("id");
			
			JSONObject thumbnails = sinppet.getJSONObject("thumbnails");
			JSONObject basic = thumbnails.getJSONObject("medium");
			
			String time = sinppet.getString("publishTime");
			String uploadDate = time.substring(0, 10);
			
			
			Exercise exercise = new Exercise();
			exercise.setUploadDate(uploadDate);
			exercise.setTitle(sinppet.getString("title"));
			exercise.setDescription(sinppet.getString("description"));
			exercise.setVideoId(id.getString("videoId"));
			exercise.setWidth(basic.getInt("width"));
			exercise.setHeight(basic.getInt("height"));
			exercise.setUrl(basic.getString("url"));
			exercise.setCategory(search);
			
			exerciseList.add(exercise);
		}
		
		return exerciseList;
		
	}
	
}
