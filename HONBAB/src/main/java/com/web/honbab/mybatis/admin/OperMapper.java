package com.web.honbab.mybatis.admin;




import java.util.List;

import com.web.honbab.admin.dto.NoticeBoardDTO;


public interface OperMapper {

	public int noticeWrite(NoticeBoardDTO dto);

	public List<NoticeBoardDTO> viewNoticeList();

	public NoticeBoardDTO viewNoticeContent(int writeNo);

	public int updateNoticeContent(NoticeBoardDTO dto);

	public int deleteNoticeContent(int writeNo);


}
