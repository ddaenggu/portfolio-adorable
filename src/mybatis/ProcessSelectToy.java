package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectToy {
	
	static ProcessSelectToy pst = new ProcessSelectToy();
	public static ProcessSelectToy instance() {
		return pst;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectToy() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selalltoy");
		sqls.close();
		return list;
	}

}
