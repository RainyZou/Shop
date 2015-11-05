package com.liveman.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.entity.Node;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class NodeServiceTest {

	@Resource
	NodeService nodeService;

	@Test
	public void getRootNodeTest() {
		Node node = nodeService.getRootTreeNodes();

		System.out.println(node);

		Assert.assertNotNull(node);

	}

	@Test
	public void testgetNodeRootList() {
		List<Node> nodes = nodeService.getNodeRootList();
		Assert.assertNotNull(nodes);
	}
}
