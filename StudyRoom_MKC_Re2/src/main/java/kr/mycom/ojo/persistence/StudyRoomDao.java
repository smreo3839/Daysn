package kr.mycom.ojo.persistence;

import java.util.List;

import kr.mycom.ojo.domain.Criteria;
import kr.mycom.ojo.domain.Room_infoVo;
import kr.mycom.ojo.domain.SearchCriteria;

public interface StudyRoomDao {

	public List<Room_infoVo> listAll() throws Exception;

	public List<Room_infoVo> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
