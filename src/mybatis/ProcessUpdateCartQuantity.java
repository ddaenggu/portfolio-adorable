package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessUpdateCartQuantity {
	
	static ProcessUpdateCartQuantity pucq = new ProcessUpdateCartQuantity();
	public static ProcessUpdateCartQuantity instance() {
		return pucq;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public void UpdateCartQuantity(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.update("updcartquantity",mp);
		sqls.commit();
		sqls.close();
	}
}
