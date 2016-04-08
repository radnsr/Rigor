package com.rigor.service;

import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rigor.model.Department;
import com.rigor.util.HibernateUtilities;;

@Service("deptService")
@Transactional
public class DeptServiceImpl  implements DeptService{

	
	public void saveDept(Department dept) {

		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
			
		session.save(dept);
		
		session.getTransaction().commit();
		
		session.close();
		HibernateUtilities.getSessionFactory().close();
	}
}
