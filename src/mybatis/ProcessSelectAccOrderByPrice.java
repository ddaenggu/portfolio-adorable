package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectAccOrderByPrice {
	
	static ProcessSelectAccOrderByPrice psaobp = new ProcessSelectAccOrderByPrice();
	public static ProcessSelectAccOrderByPrice instance() {
		return psaobp;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectAcc() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selaccorderbyprice");
		sqls.close();
		return list;
	}

}
