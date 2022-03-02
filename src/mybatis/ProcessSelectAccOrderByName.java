package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectAccOrderByName {
	
	static ProcessSelectAccOrderByName psaobn = new ProcessSelectAccOrderByName();
	public static ProcessSelectAccOrderByName instance() {
		return psaobn;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectAcc() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selaccorderbyname");
		sqls.close();
		return list;
	}

}
