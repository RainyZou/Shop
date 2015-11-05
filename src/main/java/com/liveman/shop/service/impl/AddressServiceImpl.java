package com.liveman.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.user.AddressMapper;
import com.liveman.shop.entity.user.Address;
import com.liveman.shop.entity.user.AddressExample;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressMapper addressMapper;

	private String removeKeyword(String address) {
		String result = address;
		if (result.endsWith("省")) {
			result = result.substring(0, result.length() - 1);
		}
		if (result.endsWith("市")) {
			result = result.substring(0, result.length() - 1);
		}
		if (result.endsWith("县")) {
			result = result.substring(0, result.length() - 1);
		}
		if (result.endsWith("自治区")) {
			result = result.substring(0, result.length() - 3);
		}
		if (result.endsWith("区")) {
			result = result.substring(0, result.length() - 1);
		}
		return result;
	}

	private String calculateAlias(Address address) {
		String alias = address.getName();
		alias += "(";
		alias += removeKeyword(address.getAddressSheng());
		alias += "-";
		if (address.getAddressShi().equals("市辖区") || address.getAddressShi().equals("县")) {
			alias += removeKeyword(address.getAddressXian());
		} else {
			alias += removeKeyword(address.getAddressShi());
		}
		alias += ")";
		return alias;
	}

	@Override
	public ReturnStatus add(Address address) {
		if (address.getIsDefault() == null || !address.getIsDefault().equals("on")) {
			address.setIsDefault("no");
		}

		address.setAlias(calculateAlias(address));

		int result = addressMapper.insert(address);

		if (address.getIsDefault().equals("on")) {
			AddressExample example = new AddressExample();
			example.createCriteria().andAddressShengEqualTo(address.getAddressSheng())
					.andAddressShiEqualTo(address.getAddressShi()).andAddressXianEqualTo(address.getAddressXian())
					.andAddressZhenEqualTo(address.getAddressZhen()).andAddressDetailEqualTo(address.getAddressDetail())
					.andNameEqualTo(address.getName()).andAliasEqualTo(address.getAlias())
					.andPhoneEqualTo(address.getPhone());
			List<Address> list = addressMapper.selectByExample(example);
			if (!list.isEmpty()) {
				setAsDefault(list.get(0).getId());
			}
		}

		return new ReturnStatus(result);
	}

	@Override
	public ReturnStatus edit(Address address) {
		if (address.getIsDefault() == null || !address.getIsDefault().equals("on")) {
			address.setIsDefault("no");
		}

		address.setAlias(calculateAlias(address));

		int result = addressMapper.updateByPrimaryKeySelective(address);
		if (address.getIsDefault() != null && address.getIsDefault().equals("on")) {
			setAsDefault(address.getId());
		}
		return new ReturnStatus(result);
	}

	@Override
	public ReturnStatus delete(int addressId) {
		int result = addressMapper.deleteByPrimaryKey(addressId);
		return new ReturnStatus(result);
	}

	@Override
	public List<Address> list(int userId) {
		AddressExample addressExample = new AddressExample();
		addressExample.createCriteria().andUserIdEqualTo(userId);

		return addressMapper.selectByExample(addressExample);
	}

	@Override
	public ReturnStatus setAsDefault(int addressId) {
		Address address = addressMapper.selectByPrimaryKey(addressId);

		AddressExample addressExample = new AddressExample();
		addressExample.createCriteria().andUserIdEqualTo(address.getUserId()).andIsDefaultEqualTo("on");
		List<Address> list = addressMapper.selectByExample(addressExample);
		for (Address ads : list) {
			ads.setIsDefault("no");
			addressMapper.updateByPrimaryKeySelective(ads);
		}

		address.setIsDefault("on");
		int result = addressMapper.updateByPrimaryKeySelective(address);

		return new ReturnStatus(result);
	}

	@Override
	public Address get(int addressId) {
		return addressMapper.selectByPrimaryKey(addressId);
	}

}
