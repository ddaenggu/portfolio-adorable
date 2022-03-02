package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessInsertCart {
	
	static ProcessInsertCart pic = new ProcessInsertCart();
	public static ProcessInsertCart instance() {
		return pic;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public int selectProcode(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		int procode = sqls.selectOne("selprocode",mp);
		sqls.close();
		return procode;
	}
	
	public void insertCart(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.insert("inscart",mp);
		sqls.commit();
		sqls.close();
	}

}
