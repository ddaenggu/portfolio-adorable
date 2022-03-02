package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectDressOrderByName {
	
	static ProcessSelectDressOrderByName psdobn = new ProcessSelectDressOrderByName();
	public static ProcessSelectDressOrderByName instance() {
		return psdobn;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectDress() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seldressorderbyname");
		sqls.close();
		return list;
	}

}
