package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessInsertOrder {
	
	static ProcessInsertOrder pio = new ProcessInsertOrder();
	public static ProcessInsertOrder instance() {
		return pio;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public int selectMaxOrderNum() {
		SqlSession sqls = sqlsession.openSession();
		int max = 0;
		if (sqls.selectOne("selmaxordernum") == null) {
			max = 0;
		}
		else {
			max = sqls.selectOne("selmaxordernum");
		}
		sqls.close();
		return max+1;
	}
	
	public void insertOrder(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.insert("insproductorder",mp);
		sqls.commit();
		sqls.close();
	}
	
	public void updateProduct(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.update("updproquantity",mp);
		sqls.commit();
		sqls.close();
	}
	
	public void updatePoint(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.update("updpoint",mp);
		sqls.commit();
		sqls.close();
	}

}
