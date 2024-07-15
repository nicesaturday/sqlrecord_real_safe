package com.sqlrecord.sqlrecord.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.notice.model.vo.NFile;
import com.sqlrecord.sqlrecord.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {
	List<Notice> findAll();
	List<Notice> findByCate(String cate);
	Notice findById(int noticeNo);

	int save(Notice notice);

	int update(Notice notice);

	int delete(int NoticeNo);
	List<NFile> findFiles(int id);
	int saveFile(NFile file);
	Integer getNoticeNo();
	int deleteFiles(int noticeNo);
	int updateFile(NFile file);
	int deleteFileByPosition(int noticeNo);
}
