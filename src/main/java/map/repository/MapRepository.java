package map.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import map.domain.Course;
import map.domain.Maps;

//지도 저장 및 관리
public class MapRepository {
	
	//store: Maps 객체를 저장하기 위한 Map 컬렉션
    private static Map<Long, Maps> store = new HashMap<>();
    
    //sequence: Maps 객체의 고유 식별자(ID)를 생성하기 위한 변수
    private static long sequence = 0L;
    
    //instance: MapRepository의 싱글톤 인스턴스를 가리키는 변수
    private static final MapRepository instance = new MapRepository();
    
    //싱글톤 인스턴스
    public static MapRepository getInstance(){
        return instance;
    }
    
    //모든 maps객체를 리스트로 반환
	public List<Maps> findAll(){
        return new ArrayList<>(store.values());
    }
	
	//새로운 Maps 객체를 저장소에 추가하고, 고유 식별자(ID)를 할당하여 저장된 Maps 객체를 반환
	public Maps save(Maps map){
		map.setId(++sequence);
        store.put(map.getId(), map);
        return map;
    }
	
	//저장소의 모든 데이터를 삭제
	public void clearStore(){
        store.clear();
    }
}