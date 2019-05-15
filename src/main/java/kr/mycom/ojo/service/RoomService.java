package kr.mycom.ojo.service;

import java.util.List;

import kr.mycom.ojo.domain.Criteria;
import kr.mycom.ojo.domain.Room_infoVo;
import kr.mycom.ojo.domain.SearchCriteria;

public interface RoomService {

	public List<Room_infoVo> listAll() throws Exception;

	public List<Room_infoVo> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
