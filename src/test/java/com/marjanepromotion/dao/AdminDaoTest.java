package com.marjanepromotion.dao;

import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Center;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AdminDaoTest {

    @Test
    void getRecordByEmail() {
        AdminDao adminDao = new AdminDao();

        assertEquals(1, adminDao.getRecordByEmail("bla@bla.bla").getId());

    }
}