package org.loushang.ue.feedback.dao;

import java.util.List;

import org.loushang.ue.feedback.data.FeedBack;

public interface FeedBackMapper {

	public List<FeedBack> getFeedBacksByComId(String comId);

	public void saveFeedBack(FeedBack feedBack);

}
