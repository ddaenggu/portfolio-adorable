package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectTopOrderByName {
	
	static ProcessSelectTopOrderByName pstobn = new ProcessSelectTopOrderByName();
	public static ProcessSelectTopOrderByName instance() {
		return pstobn;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectTop() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seltoporderbyname");
		sqls.close();
		return list;
	}

}
