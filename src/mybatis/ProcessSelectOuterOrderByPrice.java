package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectOuterOrderByPrice {
	
	static ProcessSelectOuterOrderByPrice psoobp = new ProcessSelectOuterOrderByPrice();
	public static ProcessSelectOuterOrderByPrice instance() {
		return psoobp;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectOuter() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selouterorderbyprice");
		sqls.close();
		return list;
	}
}
