package com.web.honbab.mybatis.admin;

import java.util.List;
import com.web.honbab.admin.dto.ADDTO;
import com.web.honbab.admin.dto.AdminDTO;
import com.web.honbab.admin.dto.NoticeBoardDTO;
import com.web.honbab.admin.dto.NoticeRepDTO;
import com.web.honbab.promo.dto.PromoDTO;
import com.web.honbab.review.dto.ReviewRepDTO;

public interface OperMapper {

	public int noticeWrite(NoticeBoardDTO dto);

	public List<NoticeBoardDTO> viewNoticeList();

	public NoticeBoardDTO viewNoticeContent(int writeNo);

	public int updateNoticeContent(NoticeBoardDTO dto);

	public int deleteNoticeContent(int writeNo);

	public void addReply(NoticeRepDTO dto);

	public List<ReviewRepDTO> getRepList(int writeNo);

	public int setAD(List<ADDTO> list);

	public List<PromoDTO> promoList();

	public int beforeDeleteAD();

	public AdminDTO adminUserCheck(String adminId);

}
