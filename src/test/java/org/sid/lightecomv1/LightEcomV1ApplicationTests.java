package org.sid.lightecomv1;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.sid.lightecomv1.dao.CategoryRepository;
import org.sid.lightecomv1.entities.Category;
import org.sid.lightecomv1.entities.Product;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LightEcomV1ApplicationTests {
    @MockBean
    CategoryRepository categoryRepository;
    private static final Logger l = LogManager.getLogger(LightEcomV1ApplicationTests.class);
    @Test
    public void TestCategory() {
      List <Product> ListProdact=new ArrayList<>();
      Product p=new Product();
      ListProdact.add(p);
        Category c=new Category();
        c.setId((long) 1);
        c.setName("mpopeo");
        c.setPhoto("mpokl");
        c.setDescription("poiuyhfj");
        c.setProducts(ListProdact);
        assertNotNull(c.getDescription());
        assertNotNull(c.getName());
        assertNotNull(c.getPhoto());
        assertNotNull(c.getId());
        when(categoryRepository.save(c)).thenReturn(c);
        l.info("afficher category",c);
    }

}
