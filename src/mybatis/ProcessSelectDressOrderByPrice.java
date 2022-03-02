package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectDressOrderByPrice {
	
	static ProcessSelectDressOrderByPrice psdobp = new ProcessSelectDressOrderByPrice();
	public static ProcessSelectDressOrderByPrice instance() {
		return psdobp;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectDress() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seldressorderbyprice");
		sqls.close();
		return list;
	}

}
