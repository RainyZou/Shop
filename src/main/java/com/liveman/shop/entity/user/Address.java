package com.liveman.shop.entity.user;

public class Address {
    private Integer id;

    private Integer userId;

    private String alias;

    private String name;

    private String addressSheng;

    private String addressShi;

    private String addressXian;

    private String addressZhen;

    private String addressDetail;

    private String phone;

    private String isDefault;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddressSheng() {
        return addressSheng;
    }

    public void setAddressSheng(String addressSheng) {
        this.addressSheng = addressSheng == null ? null : addressSheng.trim();
    }

    public String getAddressShi() {
        return addressShi;
    }

    public void setAddressShi(String addressShi) {
        this.addressShi = addressShi == null ? null : addressShi.trim();
    }

    public String getAddressXian() {
        return addressXian;
    }

    public void setAddressXian(String addressXian) {
        this.addressXian = addressXian == null ? null : addressXian.trim();
    }

    public String getAddressZhen() {
        return addressZhen;
    }

    public void setAddressZhen(String addressZhen) {
        this.addressZhen = addressZhen == null ? null : addressZhen.trim();
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail == null ? null : addressDetail.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault == null ? null : isDefault.trim();
    }
}