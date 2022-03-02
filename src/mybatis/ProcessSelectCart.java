package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectCart {

	static ProcessSelectCart psc = new ProcessSelectCart();
	public static ProcessSelectCart insatnce() {
		return psc;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectCart(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selcart",mp);
		sqls.close();
		return list;
	}
}
