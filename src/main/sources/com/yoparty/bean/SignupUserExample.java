package com.yoparty.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SignupUserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SignupUserExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
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

        public Criteria andOrderNumberIsNull() {
            addCriterion("order_number is null");
            return (Criteria) this;
        }

        public Criteria andOrderNumberIsNotNull() {
            addCriterion("order_number is not null");
            return (Criteria) this;
        }

        public Criteria andOrderNumberEqualTo(String value) {
            addCriterion("order_number =", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotEqualTo(String value) {
            addCriterion("order_number <>", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberGreaterThan(String value) {
            addCriterion("order_number >", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberGreaterThanOrEqualTo(String value) {
            addCriterion("order_number >=", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLessThan(String value) {
            addCriterion("order_number <", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLessThanOrEqualTo(String value) {
            addCriterion("order_number <=", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLike(String value) {
            addCriterion("order_number like", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotLike(String value) {
            addCriterion("order_number not like", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberIn(List<String> values) {
            addCriterion("order_number in", values, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotIn(List<String> values) {
            addCriterion("order_number not in", values, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberBetween(String value1, String value2) {
            addCriterion("order_number between", value1, value2, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotBetween(String value1, String value2) {
            addCriterion("order_number not between", value1, value2, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderDataIsNull() {
            addCriterion("order_data is null");
            return (Criteria) this;
        }

        public Criteria andOrderDataIsNotNull() {
            addCriterion("order_data is not null");
            return (Criteria) this;
        }

        public Criteria andOrderDataEqualTo(Date value) {
            addCriterionForJDBCDate("order_data =", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataNotEqualTo(Date value) {
            addCriterionForJDBCDate("order_data <>", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataGreaterThan(Date value) {
            addCriterionForJDBCDate("order_data >", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("order_data >=", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataLessThan(Date value) {
            addCriterionForJDBCDate("order_data <", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("order_data <=", value, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataIn(List<Date> values) {
            addCriterionForJDBCDate("order_data in", values, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataNotIn(List<Date> values) {
            addCriterionForJDBCDate("order_data not in", values, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("order_data between", value1, value2, "orderData");
            return (Criteria) this;
        }

        public Criteria andOrderDataNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("order_data not between", value1, value2, "orderData");
            return (Criteria) this;
        }

        public Criteria andActivityIdIsNull() {
            addCriterion("activity_id is null");
            return (Criteria) this;
        }

        public Criteria andActivityIdIsNotNull() {
            addCriterion("activity_id is not null");
            return (Criteria) this;
        }

        public Criteria andActivityIdEqualTo(Integer value) {
            addCriterion("activity_id =", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdNotEqualTo(Integer value) {
            addCriterion("activity_id <>", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdGreaterThan(Integer value) {
            addCriterion("activity_id >", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("activity_id >=", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdLessThan(Integer value) {
            addCriterion("activity_id <", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdLessThanOrEqualTo(Integer value) {
            addCriterion("activity_id <=", value, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdIn(List<Integer> values) {
            addCriterion("activity_id in", values, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdNotIn(List<Integer> values) {
            addCriterion("activity_id not in", values, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdBetween(Integer value1, Integer value2) {
            addCriterion("activity_id between", value1, value2, "activityId");
            return (Criteria) this;
        }

        public Criteria andActivityIdNotBetween(Integer value1, Integer value2) {
            addCriterion("activity_id not between", value1, value2, "activityId");
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

        public Criteria andLocationIsNull() {
            addCriterion("location is null");
            return (Criteria) this;
        }

        public Criteria andLocationIsNotNull() {
            addCriterion("location is not null");
            return (Criteria) this;
        }

        public Criteria andLocationEqualTo(String value) {
            addCriterion("location =", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationNotEqualTo(String value) {
            addCriterion("location <>", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationGreaterThan(String value) {
            addCriterion("location >", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationGreaterThanOrEqualTo(String value) {
            addCriterion("location >=", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationLessThan(String value) {
            addCriterion("location <", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationLessThanOrEqualTo(String value) {
            addCriterion("location <=", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationLike(String value) {
            addCriterion("location like", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationNotLike(String value) {
            addCriterion("location not like", value, "location");
            return (Criteria) this;
        }

        public Criteria andLocationIn(List<String> values) {
            addCriterion("location in", values, "location");
            return (Criteria) this;
        }

        public Criteria andLocationNotIn(List<String> values) {
            addCriterion("location not in", values, "location");
            return (Criteria) this;
        }

        public Criteria andLocationBetween(String value1, String value2) {
            addCriterion("location between", value1, value2, "location");
            return (Criteria) this;
        }

        public Criteria andLocationNotBetween(String value1, String value2) {
            addCriterion("location not between", value1, value2, "location");
            return (Criteria) this;
        }

        public Criteria andSignupNumberIsNull() {
            addCriterion("signup_number is null");
            return (Criteria) this;
        }

        public Criteria andSignupNumberIsNotNull() {
            addCriterion("signup_number is not null");
            return (Criteria) this;
        }

        public Criteria andSignupNumberEqualTo(Integer value) {
            addCriterion("signup_number =", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberNotEqualTo(Integer value) {
            addCriterion("signup_number <>", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberGreaterThan(Integer value) {
            addCriterion("signup_number >", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("signup_number >=", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberLessThan(Integer value) {
            addCriterion("signup_number <", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberLessThanOrEqualTo(Integer value) {
            addCriterion("signup_number <=", value, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberIn(List<Integer> values) {
            addCriterion("signup_number in", values, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberNotIn(List<Integer> values) {
            addCriterion("signup_number not in", values, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberBetween(Integer value1, Integer value2) {
            addCriterion("signup_number between", value1, value2, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andSignupNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("signup_number not between", value1, value2, "signupNumber");
            return (Criteria) this;
        }

        public Criteria andStatueIsNull() {
            addCriterion("statue is null");
            return (Criteria) this;
        }

        public Criteria andStatueIsNotNull() {
            addCriterion("statue is not null");
            return (Criteria) this;
        }

        public Criteria andStatueEqualTo(Byte value) {
            addCriterion("statue =", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueNotEqualTo(Byte value) {
            addCriterion("statue <>", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueGreaterThan(Byte value) {
            addCriterion("statue >", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueGreaterThanOrEqualTo(Byte value) {
            addCriterion("statue >=", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueLessThan(Byte value) {
            addCriterion("statue <", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueLessThanOrEqualTo(Byte value) {
            addCriterion("statue <=", value, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueIn(List<Byte> values) {
            addCriterion("statue in", values, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueNotIn(List<Byte> values) {
            addCriterion("statue not in", values, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueBetween(Byte value1, Byte value2) {
            addCriterion("statue between", value1, value2, "statue");
            return (Criteria) this;
        }

        public Criteria andStatueNotBetween(Byte value1, Byte value2) {
            addCriterion("statue not between", value1, value2, "statue");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNull() {
            addCriterion("pay_type is null");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNotNull() {
            addCriterion("pay_type is not null");
            return (Criteria) this;
        }

        public Criteria andPayTypeEqualTo(Byte value) {
            addCriterion("pay_type =", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotEqualTo(Byte value) {
            addCriterion("pay_type <>", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThan(Byte value) {
            addCriterion("pay_type >", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("pay_type >=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThan(Byte value) {
            addCriterion("pay_type <", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThanOrEqualTo(Byte value) {
            addCriterion("pay_type <=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeIn(List<Byte> values) {
            addCriterion("pay_type in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotIn(List<Byte> values) {
            addCriterion("pay_type not in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeBetween(Byte value1, Byte value2) {
            addCriterion("pay_type between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotBetween(Byte value1, Byte value2) {
            addCriterion("pay_type not between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andFullcutIsNull() {
            addCriterion("fullcut is null");
            return (Criteria) this;
        }

        public Criteria andFullcutIsNotNull() {
            addCriterion("fullcut is not null");
            return (Criteria) this;
        }

        public Criteria andFullcutEqualTo(Byte value) {
            addCriterion("fullcut =", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutNotEqualTo(Byte value) {
            addCriterion("fullcut <>", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutGreaterThan(Byte value) {
            addCriterion("fullcut >", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutGreaterThanOrEqualTo(Byte value) {
            addCriterion("fullcut >=", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutLessThan(Byte value) {
            addCriterion("fullcut <", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutLessThanOrEqualTo(Byte value) {
            addCriterion("fullcut <=", value, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutIn(List<Byte> values) {
            addCriterion("fullcut in", values, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutNotIn(List<Byte> values) {
            addCriterion("fullcut not in", values, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutBetween(Byte value1, Byte value2) {
            addCriterion("fullcut between", value1, value2, "fullcut");
            return (Criteria) this;
        }

        public Criteria andFullcutNotBetween(Byte value1, Byte value2) {
            addCriterion("fullcut not between", value1, value2, "fullcut");
            return (Criteria) this;
        }

        public Criteria andInsuranceIsNull() {
            addCriterion("insurance is null");
            return (Criteria) this;
        }

        public Criteria andInsuranceIsNotNull() {
            addCriterion("insurance is not null");
            return (Criteria) this;
        }

        public Criteria andInsuranceEqualTo(Boolean value) {
            addCriterion("insurance =", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceNotEqualTo(Boolean value) {
            addCriterion("insurance <>", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceGreaterThan(Boolean value) {
            addCriterion("insurance >", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceGreaterThanOrEqualTo(Boolean value) {
            addCriterion("insurance >=", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceLessThan(Boolean value) {
            addCriterion("insurance <", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceLessThanOrEqualTo(Boolean value) {
            addCriterion("insurance <=", value, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceIn(List<Boolean> values) {
            addCriterion("insurance in", values, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceNotIn(List<Boolean> values) {
            addCriterion("insurance not in", values, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceBetween(Boolean value1, Boolean value2) {
            addCriterion("insurance between", value1, value2, "insurance");
            return (Criteria) this;
        }

        public Criteria andInsuranceNotBetween(Boolean value1, Boolean value2) {
            addCriterion("insurance not between", value1, value2, "insurance");
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