package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessDeleteCart {
	
	static ProcessDeleteCart pdc = new ProcessDeleteCart();
	public static ProcessDeleteCart instance() {
		return pdc;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public void deleteCart(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.delete("delcart",mp);
		sqls.commit();
		sqls.close();
	}
}
