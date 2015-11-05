package com.liveman.shop.dao.user;

import com.liveman.shop.entity.user.UserImage;
import com.liveman.shop.entity.user.UserImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserImageMapper {
    int countByExample(UserImageExample example);

    int deleteByExample(UserImageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserImage record);

    int insertSelective(UserImage record);

    List<UserImage> selectByExampleWithBLOBs(UserImageExample example);

    List<UserImage> selectByExample(UserImageExample example);

    UserImage selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserImage record, @Param("example") UserImageExample example);

    int updateByExampleWithBLOBs(@Param("record") UserImage record, @Param("example") UserImageExample example);

    int updateByExample(@Param("record") UserImage record, @Param("example") UserImageExample example);

    int updateByPrimaryKeySelective(UserImage record);

    int updateByPrimaryKeyWithBLOBs(UserImage record);
}