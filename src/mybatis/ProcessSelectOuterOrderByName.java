package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectOuterOrderByName {
	
	static ProcessSelectOuterOrderByName psoobn = new ProcessSelectOuterOrderByName();
	public static ProcessSelectOuterOrderByName instance() {
		return psoobn;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectOuter() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selouterorderbyname");
		sqls.close();
		return list;
	}

}
