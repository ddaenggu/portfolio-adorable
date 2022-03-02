package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectAcc {
	
	static ProcessSelectAcc psa = new ProcessSelectAcc();
	public static ProcessSelectAcc instance() {
		return psa;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectAcc() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selacc");
		sqls.close();
		return list;
	}

}
