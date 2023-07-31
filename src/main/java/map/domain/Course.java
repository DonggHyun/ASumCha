package map.domain;

public class Course {
	
	private double lat;
	private double lon;
	
    public Course() {
    }

	public Course(double lat, double lon) {
		this.lat = lat;
		this.lon = lon;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLog() {
		return lon;
	}

	public void setLog(double lon) {
		this.lon = lon;
	}   
}
