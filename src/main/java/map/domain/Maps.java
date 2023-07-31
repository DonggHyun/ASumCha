package map.domain;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Maps {
	
	private Long id;
	private String trackName;
	private double distance;
	private double totalTime;
	private double averSpeed;
	private double lat;
	private double lng;
	private String date;
	private String courseJson;
	List<Course> course = new ArrayList<>();
	
	private void createCourse() {
		TypeToken<List<Course>> typeToken = new TypeToken<List<Course>>(){};
		this.course = new Gson().fromJson(this.courseJson, typeToken.getType());
		this.courseJson = "";
	}
	
    public Maps() {
    }

	public Maps(String trackName, double distance, double totalTime, double averSpeed, double lat, double lng,
			String date, String courseJson) {
		this.trackName = trackName;
		this.distance = distance;
		this.totalTime = totalTime;
		this.averSpeed = averSpeed;
		this.lat = lat;
		this.lng = lng;
		this.date = date;
		this.courseJson = courseJson;
		createCourse();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTrackName() {
		return trackName;
	}

	public void setTrackName(String trackName) {
		this.trackName = trackName;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(double totalTime) {
		this.totalTime = totalTime;
	}

	public double getAverSpeed() {
		return averSpeed;
	}

	public void setAverSpeed(double averSpeed) {
		this.averSpeed = averSpeed;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public List<Course> getCourse() {
		return course;
	}

	public void setCourse(List<Course> course) {
		this.course = course;
	}

}
