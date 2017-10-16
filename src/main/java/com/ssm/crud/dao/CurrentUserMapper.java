package com.ssm.crud.dao;

import com.ssm.bean.CurrentUser;
import com.ssm.bean.CurrentUserExample;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CurrentUserMapper {
    long countByExample(CurrentUserExample example);

    int deleteByExample(CurrentUserExample example);

    int deleteByPrimaryKey(BigDecimal userId);

    int insert(CurrentUser record);

    int insertSelective(CurrentUser record);

    List<CurrentUser> selectByExample(CurrentUserExample example);

    CurrentUser selectByPrimaryKey(BigDecimal userId);

    int updateByExampleSelective(@Param("record") CurrentUser record, @Param("example") CurrentUserExample example);

    int updateByExample(@Param("record") CurrentUser record, @Param("example") CurrentUserExample example);

    int updateByPrimaryKeySelective(CurrentUser record);

    int updateByPrimaryKey(CurrentUser record);
}