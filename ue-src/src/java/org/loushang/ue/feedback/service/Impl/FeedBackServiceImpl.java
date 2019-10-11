package org.loushang.ue.feedback.service.Impl;

import java.util.List;

import org.loushang.ue.feedback.dao.FeedBackMapper;
import org.loushang.ue.feedback.data.FeedBack;
import org.loushang.ue.feedback.service.IFeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional("mybatisTransactionManager")
public class FeedBackServiceImpl implements IFeedBackService {

	@Autowired
	private FeedBackMapper feedBackMapper;

	@Override
	public List<FeedBack> getFeedBacksByComId(String comId) {
		// TODO Auto-generated method stub
		// Map map = new HashMap();
		// map.put("comId", comId);
		// return feedBackMapper.findFeedbackById(map);
		return feedBackMapper.getFeedBacksByComId(comId);
	}

	@Override
	public void saveFeedBack(FeedBack feedBack) {
		feedBackMapper.saveFeedBack(feedBack);
	}

}
