package com.en.main.mapper;

import com.en.main.dto.CommentVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommentMapper {
    @Select("select * from event_comment where e_no= #{e_no} order by c_no desc")
    List<CommentVO> getAllComment(int e_no);

    @Insert("insert into event_comment values (#{e_no}, #{c_writer}, #{c_content}, sysdate, #{c_type}, event_comment_seq.nextval, #{c_delete_code})")
    void insertComment (CommentVO commentVO);

    @Delete("delete event_comment where c_no = #{no}")
    int deleteComment(int no);
}
