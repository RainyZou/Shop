package com.liveman.shop.entity.user;

import java.util.ArrayList;
import java.util.List;

public class AddressExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AddressExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andAliasIsNull() {
            addCriterion("alias is null");
            return (Criteria) this;
        }

        public Criteria andAliasIsNotNull() {
            addCriterion("alias is not null");
            return (Criteria) this;
        }

        public Criteria andAliasEqualTo(String value) {
            addCriterion("alias =", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasNotEqualTo(String value) {
            addCriterion("alias <>", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasGreaterThan(String value) {
            addCriterion("alias >", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasGreaterThanOrEqualTo(String value) {
            addCriterion("alias >=", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasLessThan(String value) {
            addCriterion("alias <", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasLessThanOrEqualTo(String value) {
            addCriterion("alias <=", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasLike(String value) {
            addCriterion("alias like", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasNotLike(String value) {
            addCriterion("alias not like", value, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasIn(List<String> values) {
            addCriterion("alias in", values, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasNotIn(List<String> values) {
            addCriterion("alias not in", values, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasBetween(String value1, String value2) {
            addCriterion("alias between", value1, value2, "alias");
            return (Criteria) this;
        }

        public Criteria andAliasNotBetween(String value1, String value2) {
            addCriterion("alias not between", value1, value2, "alias");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andAddressShengIsNull() {
            addCriterion("address_sheng is null");
            return (Criteria) this;
        }

        public Criteria andAddressShengIsNotNull() {
            addCriterion("address_sheng is not null");
            return (Criteria) this;
        }

        public Criteria andAddressShengEqualTo(String value) {
            addCriterion("address_sheng =", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengNotEqualTo(String value) {
            addCriterion("address_sheng <>", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengGreaterThan(String value) {
            addCriterion("address_sheng >", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengGreaterThanOrEqualTo(String value) {
            addCriterion("address_sheng >=", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengLessThan(String value) {
            addCriterion("address_sheng <", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengLessThanOrEqualTo(String value) {
            addCriterion("address_sheng <=", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengLike(String value) {
            addCriterion("address_sheng like", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengNotLike(String value) {
            addCriterion("address_sheng not like", value, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengIn(List<String> values) {
            addCriterion("address_sheng in", values, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengNotIn(List<String> values) {
            addCriterion("address_sheng not in", values, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengBetween(String value1, String value2) {
            addCriterion("address_sheng between", value1, value2, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShengNotBetween(String value1, String value2) {
            addCriterion("address_sheng not between", value1, value2, "addressSheng");
            return (Criteria) this;
        }

        public Criteria andAddressShiIsNull() {
            addCriterion("address_shi is null");
            return (Criteria) this;
        }

        public Criteria andAddressShiIsNotNull() {
            addCriterion("address_shi is not null");
            return (Criteria) this;
        }

        public Criteria andAddressShiEqualTo(String value) {
            addCriterion("address_shi =", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiNotEqualTo(String value) {
            addCriterion("address_shi <>", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiGreaterThan(String value) {
            addCriterion("address_shi >", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiGreaterThanOrEqualTo(String value) {
            addCriterion("address_shi >=", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiLessThan(String value) {
            addCriterion("address_shi <", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiLessThanOrEqualTo(String value) {
            addCriterion("address_shi <=", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiLike(String value) {
            addCriterion("address_shi like", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiNotLike(String value) {
            addCriterion("address_shi not like", value, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiIn(List<String> values) {
            addCriterion("address_shi in", values, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiNotIn(List<String> values) {
            addCriterion("address_shi not in", values, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiBetween(String value1, String value2) {
            addCriterion("address_shi between", value1, value2, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressShiNotBetween(String value1, String value2) {
            addCriterion("address_shi not between", value1, value2, "addressShi");
            return (Criteria) this;
        }

        public Criteria andAddressXianIsNull() {
            addCriterion("address_xian is null");
            return (Criteria) this;
        }

        public Criteria andAddressXianIsNotNull() {
            addCriterion("address_xian is not null");
            return (Criteria) this;
        }

        public Criteria andAddressXianEqualTo(String value) {
            addCriterion("address_xian =", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianNotEqualTo(String value) {
            addCriterion("address_xian <>", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianGreaterThan(String value) {
            addCriterion("address_xian >", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianGreaterThanOrEqualTo(String value) {
            addCriterion("address_xian >=", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianLessThan(String value) {
            addCriterion("address_xian <", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianLessThanOrEqualTo(String value) {
            addCriterion("address_xian <=", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianLike(String value) {
            addCriterion("address_xian like", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianNotLike(String value) {
            addCriterion("address_xian not like", value, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianIn(List<String> values) {
            addCriterion("address_xian in", values, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianNotIn(List<String> values) {
            addCriterion("address_xian not in", values, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianBetween(String value1, String value2) {
            addCriterion("address_xian between", value1, value2, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressXianNotBetween(String value1, String value2) {
            addCriterion("address_xian not between", value1, value2, "addressXian");
            return (Criteria) this;
        }

        public Criteria andAddressZhenIsNull() {
            addCriterion("address_zhen is null");
            return (Criteria) this;
        }

        public Criteria andAddressZhenIsNotNull() {
            addCriterion("address_zhen is not null");
            return (Criteria) this;
        }

        public Criteria andAddressZhenEqualTo(String value) {
            addCriterion("address_zhen =", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenNotEqualTo(String value) {
            addCriterion("address_zhen <>", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenGreaterThan(String value) {
            addCriterion("address_zhen >", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenGreaterThanOrEqualTo(String value) {
            addCriterion("address_zhen >=", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenLessThan(String value) {
            addCriterion("address_zhen <", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenLessThanOrEqualTo(String value) {
            addCriterion("address_zhen <=", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenLike(String value) {
            addCriterion("address_zhen like", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenNotLike(String value) {
            addCriterion("address_zhen not like", value, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenIn(List<String> values) {
            addCriterion("address_zhen in", values, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenNotIn(List<String> values) {
            addCriterion("address_zhen not in", values, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenBetween(String value1, String value2) {
            addCriterion("address_zhen between", value1, value2, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressZhenNotBetween(String value1, String value2) {
            addCriterion("address_zhen not between", value1, value2, "addressZhen");
            return (Criteria) this;
        }

        public Criteria andAddressDetailIsNull() {
            addCriterion("address_detail is null");
            return (Criteria) this;
        }

        public Criteria andAddressDetailIsNotNull() {
            addCriterion("address_detail is not null");
            return (Criteria) this;
        }

        public Criteria andAddressDetailEqualTo(String value) {
            addCriterion("address_detail =", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailNotEqualTo(String value) {
            addCriterion("address_detail <>", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailGreaterThan(String value) {
            addCriterion("address_detail >", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailGreaterThanOrEqualTo(String value) {
            addCriterion("address_detail >=", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailLessThan(String value) {
            addCriterion("address_detail <", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailLessThanOrEqualTo(String value) {
            addCriterion("address_detail <=", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailLike(String value) {
            addCriterion("address_detail like", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailNotLike(String value) {
            addCriterion("address_detail not like", value, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailIn(List<String> values) {
            addCriterion("address_detail in", values, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailNotIn(List<String> values) {
            addCriterion("address_detail not in", values, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailBetween(String value1, String value2) {
            addCriterion("address_detail between", value1, value2, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andAddressDetailNotBetween(String value1, String value2) {
            addCriterion("address_detail not between", value1, value2, "addressDetail");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andIsDefaultIsNull() {
            addCriterion("is_default is null");
            return (Criteria) this;
        }

        public Criteria andIsDefaultIsNotNull() {
            addCriterion("is_default is not null");
            return (Criteria) this;
        }

        public Criteria andIsDefaultEqualTo(String value) {
            addCriterion("is_default =", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultNotEqualTo(String value) {
            addCriterion("is_default <>", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultGreaterThan(String value) {
            addCriterion("is_default >", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultGreaterThanOrEqualTo(String value) {
            addCriterion("is_default >=", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultLessThan(String value) {
            addCriterion("is_default <", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultLessThanOrEqualTo(String value) {
            addCriterion("is_default <=", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultLike(String value) {
            addCriterion("is_default like", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultNotLike(String value) {
            addCriterion("is_default not like", value, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultIn(List<String> values) {
            addCriterion("is_default in", values, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultNotIn(List<String> values) {
            addCriterion("is_default not in", values, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultBetween(String value1, String value2) {
            addCriterion("is_default between", value1, value2, "isDefault");
            return (Criteria) this;
        }

        public Criteria andIsDefaultNotBetween(String value1, String value2) {
            addCriterion("is_default not between", value1, value2, "isDefault");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}