package com.en.main.mapper;

import com.en.main.dto.TemplateProductVO;
import com.en.main.dto.WeddingVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Select("select * from template order by t_pk")
    List<TemplateProductVO> getAllTemplates();

    @Select("select * from template where t_pk = #{t_pk}")
    TemplateProductVO getTemplateByPk(int t_pk);

//    @Insert("insert into event values (event_seq.nextval, '#{m_id}', ''")
    @Insert("insert into event values (event_seq.nextval,'test3', 'https://www.amazon.co.jp/'")
    void createEvent();

    @Insert("insert into wedding_info values (event_seq.currval, #{t_pk}," +
            "#{w_fam_jp_groom}, #{ w_name_jp_groom}, #{w_fam_eng_groom}, #{w_name_eng_groom}," +
            "#{w_fam_jp_bride}, #{w_name_jp_bride}, #{w_fam_eng_bride}, #{ w_name_eng_bride}," +
            "#{w_date}, #{w_wedding_time}, #{w_wedding_assemble}, #{w_wedding_postcode}, #{w_wedding_address}, #{w_wedding_building}," +
            "#{w_reception_time}, #{w_reception_assemble}, #{w_reception_postcode}, #{w_reception_address}, #{w_reception_building}, " +
            "#{w_message_invite}, #{w_message_bye}," +
            "#{w_img1}, #{w_img2}, #{w_img3}, #{w_img_share} )")
    void insertWeddingInfo(WeddingVO weddingVO, int t_pk);

}
