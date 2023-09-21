package com.tripleJ.gg88.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.model.PagingDto;
import com.tripleJ.gg88.repository.ExerciseRepository;

@Service
public class ExerciseService {
	private final ExerciseRepository repository;
	
	@Autowired
	public ExerciseService(ExerciseRepository repository) {
		super();
		this.repository = repository;
	}

	public List<Exercise> search(String search, PagingDto dto) throws Exception {
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyD1oh2pUIox-pNVm652OsV4Q-cImdiVpQg";
		apiurl += "&part=snippet&type=video&maxResults=20&videoEmbeddable=true";
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
		if(repository.searchData(search) == 0) {
			saveInfo(response.toString(), search);
			return repository.selectKeyword(search);
		} else {
			return repository.getList(dto);
		}
	}
	
	public void saveInfo(String response, String search) throws Exception {
		JSONObject jObject = new JSONObject(response);
		JSONArray jArray = (JSONArray) jObject.getJSONArray("items");
		
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
			
			repository.saveInfo(exercise);
		}
		
	}
	
	public PagingDto paganation(int currentNum, String category) {
		PagingDto dto = new PagingDto();
		
		dto.setCurrentPageNo(currentNum);
		dto.setTotalRecordCount(repository.searchData(category));
		
		setRealEnd(dto);
		setFirstPage(dto);
		setLastPage(dto);
		setFirstRecordIndex(dto);
		dto.setRecordCountPerPage(dto.getFirstRecordIndex() + 9);
		setXprevXnext(dto);
		
		return dto;
	}
	
	private void setRealEnd(PagingDto dto) {
		dto.setRecordCountPerPage(9);
		int realEnd = (int)(Math.ceil((dto.getTotalRecordCount() * 1.0) / dto.getRecordCountPerPage()));
		dto.setRealEnd(realEnd);
	}
	
	private void setFirstPage(PagingDto dto) {
		int lastPageNoOnPageList = (int)(Math.ceil(dto.getCurrentPageNo()/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		dto.setFirstPageNoOnPageList(firstPageNoOnPageList);
	}
	
	private void setLastPage(PagingDto dto) {
		int lastPageNoOnPageList = (int)(Math.ceil(dto.getCurrentPageNo()/10.0)) * 10;
		int realEnd = (int)(Math.ceil((dto.getTotalRecordCount() * 1.0) / dto.getRecordCountPerPage()));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		dto.setLastPageNoOnPageList(lastPageNoOnPageList);
	}
	
	private void setFirstRecordIndex(PagingDto dto) {
		int firstRecordIndex = (dto.getCurrentPageNo() - 1) * dto.getRecordCountPerPage();
		dto.setFirstRecordIndex(firstRecordIndex);
	}
	
	private void setXprevXnext(PagingDto dto) {
		boolean xprev= dto.getFirstPageNoOnPageList() > 1;
		dto.setXprev(xprev);
		
		boolean xnext = dto.getLastPageNoOnPageList() < dto.getRealEnd();
		dto.setXnext(xnext);
	}
	
	public List<Exercise> getList(PagingDto pagingDto){
		return repository.getList(pagingDto);
	}
	
}
