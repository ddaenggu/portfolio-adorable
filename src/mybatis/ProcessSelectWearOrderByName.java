package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectWearOrderByName {

	static ProcessSelectWearOrderByName pswobn = new ProcessSelectWearOrderByName();

	public static ProcessSelectWearOrderByName instance() {
		return pswobn;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectWear() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallwearorderbyname");
		sqls.close();
		return list;
	}
}
